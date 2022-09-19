import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:src/services/ads/ad_helper.dart';
import 'package:src/services/firestore.dart';
import 'package:src/services/models.dart';

import '../../firebase_options.dart';
import '../../providers/my_database.dart';
import 'video_item.dart';

class VideosListScreen extends StatelessWidget {
  const VideosListScreen({Key? key}) : super(key: key);

  Future<List<YoutubeVideo>>? getVideos() async {
    List<YoutubeVideo> videos;

    var db = await MyDatabase.connection();

    //  var settings = await db.query("settings", where: "key='last_sync'");
    //  var lastSyncDate = DateTime.parse(settings.last['value'].toString());

    //if (lastSyncDate) {}
    //var firestoreYoutubeVideos = await FirestoreService().getYoutubeVideos();

    // for (int i = 0; i < firestoreYoutubeVideos.length; ++i) {
    //   var youtube_video = firestoreYoutubeVideos[i].toJson();
    //   db.insert("youtube_videos", youtube_video);
    // }
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
