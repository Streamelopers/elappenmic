import 'package:src/components/about/about_screen.dart';

import 'components/videos/video_detail_screen.dart';
import 'components/videos/videos_list_screen.dart';

var appRoutes = {
  '/': (context) => const VideosListScreen(),
  '/about': (context) => const AboutScreen()
};
