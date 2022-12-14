import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:src/components/about/about_screen.dart';
import 'package:src/components/audio/audio_screen.dart';
import 'components/shows/shows_screen.dart';
import 'components/videos/videos_list_screen.dart';
import 'components/audio/audio_screen.dart';

var appScreens = {
  {
    "screen": const AudioScreen(),
    "icon": const Icon(
      FontAwesomeIcons.radio,
      color: Colors.white,
      size: 20,
    ),
    "title": "Radio"
  },
  {
    "screen": const VideosListScreen(),
    "icon": const Icon(
      FontAwesomeIcons.video,
      color: Colors.white,
      size: 20,
    ),
    "title": "Videos"
  },
  {
    "screen": const ShowsScreen(),
    "icon": const Icon(
      FontAwesomeIcons.masksTheater,
      color: Colors.white,
      size: 20,
    ),
    "title": "Shows"
  },
  {
    "screen": const AboutScreen(),
    "icon": const Icon(
      FontAwesomeIcons.circleQuestion,
      color: Colors.white,
      size: 20,
    ),
    "title": "Acerca De"
  },
};
