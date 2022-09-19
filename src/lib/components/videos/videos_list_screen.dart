import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:src/services/ads/ad_helper.dart';
import 'package:src/services/firestore.dart';
import 'package:src/services/models.dart';

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
