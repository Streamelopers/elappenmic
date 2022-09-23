import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> with WidgetsBindingObserver {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _player.setAudioSource(
          AudioSource.uri(Uri.parse("https://radio5.domint.net:8222/stream")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Widget _playerButton(PlayerState? playerState) {
    // 1
    final processingState = playerState?.processingState;
    final playing = playerState?.playing;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      // 2
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: CircularProgressIndicator(),
      );
    } else if (playing!) {
      // 4
      return IconButton(
        icon: Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: _player.pause,
      );
    } else {
      // 3
      return IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: _player.play,
      );
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication)) {
      //   throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Escucha la emisora radial 99.3 FM en vivo."),
                      _playerButton(playerState),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Puedes llamar a la cabina y hablar con los hosts"),
                OutlinedButton.icon(
                    icon: const Icon(
                      FontAwesomeIcons.phone,
                      size: 20,
                    ),
                    label: const Text("Llamar a cabina"),
                    onPressed: () async {
                      await _makePhoneCall("tel:+18095682222");
                      await _player.pause();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
