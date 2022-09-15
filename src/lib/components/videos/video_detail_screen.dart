import 'package:flutter/material.dart';
import 'package:src/services/models.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class VideoDetailScreen extends StatefulWidget {
  final YoutubeVideo video;

  VideoDetailScreen({super.key, required this.video});
  @override
  State<VideoDetailScreen> createState() =>
      _VideoDetailScreenState(video: this.video);
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  YoutubeVideo video;
  _VideoDetailScreenState({required this.video});
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
          initialUrl: "https://www.youtube.com/embed/${video.key}?controls=0",
          javascriptMode: JavascriptMode.unrestricted),
    );
  }
}
