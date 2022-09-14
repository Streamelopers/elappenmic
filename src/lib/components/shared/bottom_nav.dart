import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.video,
            size: 20,
          ),
          label: 'Videos',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circleQuestion,
            size: 20,
          ),
          label: 'Acerca de',
        )
      ],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/about');
            break;
        }
      },
    );
  }
}
