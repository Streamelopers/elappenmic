import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:src/services/models.dart';
import 'package:intl/intl.dart';

import '../../providers/my_database.dart';
import '../../services/firestore.dart';
import 'video_item.dart';

class VideosListScreen extends StatelessWidget {
  const VideosListScreen({Key? key}) : super(key: key);

  Future<List<YoutubeVideo>>? getVideos() async {
    List<YoutubeVideo> videos;

    var db = await MyDatabase.connection();

    var settings = await db.query("settings");

    print('settings');
    print(settings);
    // var lastSyncDate = DateTime.parse(settings.last['value'].toString());

    //if (lastSyncDate) {}
    if (settings.length == 0) {
      print("Descargando de firestore");
      var firestoreYoutubeVideos = await FirestoreService().getYoutubeVideos();

      for (int i = 0; i < firestoreYoutubeVideos.length; ++i) {
        var youtube_video = firestoreYoutubeVideos[i].toJson();
        db.insert(
          "youtube_videos",
          youtube_video,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      var last_sync = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
      await db.insert("settings", {'key': 'last_sync', 'value': last_sync});
    } else {
      print("No vamos a ir a firestore a buscar nada");
    }

    print("Cargando desde la base de datos");
    videos =
        (await db.query("youtube_videos")).map(YoutubeVideo.fromJson).toList();
    return videos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YoutubeVideo>>(
        future: getVideos(), //FirestoreService().getYoutubeVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Text("Cargando"));
          } else if (snapshot.hasData) {
            var videos = snapshot.data!;
            return Scaffold(
                body: ListView.separated(
                    primary: false,
                    itemCount: videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return VideoItem(video: videos[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider()));
          } else {
            return const Scaffold(
                body: Center(child: Text("No hay informacion disponible")));
          }
        });
  }
}
