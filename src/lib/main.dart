import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:src/components/home/home_screen.dart';
import 'package:src/components/videos/videos_list_screen.dart';
import 'services/firestore.dart';
import 'routes.dart';
import 'services/models.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FutureProvider(
                create: (_) => FirestoreService().getYoutubeVideos(),
                initialData: YoutubeVideo(),
                child: const MaterialApp(
                  home: HomeScreen(),
                  //  theme: appTheme,
                ));
          }
          return Scaffold(body: Text('loading'));
        });
  }
}
