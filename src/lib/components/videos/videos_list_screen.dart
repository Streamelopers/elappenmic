import 'package:flutter/material.dart';
import 'package:src/services/firestore.dart';
import 'package:src/services/models.dart';

import '../shared/bottom_nav.dart';
import 'video_item.dart';

class VideosListScreen extends StatelessWidget {
  const VideosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YoutubeVideo>>(
        future: FirestoreService().getYoutubeVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Text("Cargando"));
          } else if (snapshot.hasData) {
            var videos = snapshot.data!;
            return Scaffold(
                body: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20.0),
                  crossAxisCount: 1,
                  children:
                      videos.map((video) => VideoItem(video: video)).toList(),
                ),
                bottomNavigationBar: const BottomNavBar());
          } else {
            return const Scaffold(
                body: Center(child: Text("No hay informacion disponible")));
          }
        });
  }
}
