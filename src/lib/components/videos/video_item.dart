import 'package:flutter/material.dart';
import 'package:src/services/models.dart';

import 'video_detail_screen.dart';

class VideoItem extends StatelessWidget {
  final YoutubeVideo video;
  const VideoItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: video.key,
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        VideoDetailScreen(video: video),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    video.thumbnail_2x,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            )));
  }
}
