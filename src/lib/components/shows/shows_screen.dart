import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowsScreen extends StatelessWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: WebView(
            initialUrl: "https://tix.do",
            javascriptMode: JavascriptMode.unrestricted),
      ),
    );
  }
}
