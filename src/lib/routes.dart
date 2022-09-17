import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:src/components/about/about_screen.dart';
import 'package:src/components/audio/audio_screen.dart';
import 'components/videos/videos_list_screen.dart';
import 'components/audio/audio_screen.dart';

var appScreens = {
  {
    "screen": const AudioScreen(),
    "icon": const Icon(
      FontAwesomeIcons.fileAudio,
      size: 20,
    ),
    "title": "Radio"
  },
  {
    "screen": const VideosListScreen(),
    "icon": const Icon(
      FontAwesomeIcons.video,
      size: 20,
    ),
    "title": "Videos"
  },
  {
    "screen": const AboutScreen(),
    "icon": const Icon(
      FontAwesomeIcons.circleQuestion,
      size: 20,
    ),
    "title": "Acerca De"
  },
};
