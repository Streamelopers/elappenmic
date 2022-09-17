import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:src/components/about/about_screen.dart';
import 'components/videos/videos_list_screen.dart';

var appScreens = {
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
  }
};
