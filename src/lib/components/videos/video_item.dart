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
                  Flexible(
                    flex: 3,
                    child: SizedBox(
                      child: Image.network(
                        video.thumbnail_3x,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        video.title,
                        style: const TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
