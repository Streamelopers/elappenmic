import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  FlutterLocalNotificationsPlugin flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();
  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: appScreens.elementAt(_currentIndex)['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: appScreens
              .map((item) => BottomNavigationBarItem(
                  icon: item["icon"] as Icon, label: item["title"].toString()))
              .toList(),
          onTap: _selectScreen),
    );
  }

  @override
  void initState() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterNotificationPlugin.initialize(initializationSettings);
    notificationScheduled();
  }

  Future<void> notificationScheduled() async {
    var time = const Time(17, 0, 00);
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'elappenmic daily notification id', 'elappenmic',
        channelDescription: 'repeatDailyAtTime description',
        importance: Importance.max,
        // sound: 'slow_spring_board',
        ledColor: Color(0xFF3EB16F),
        ledOffMs: 1000,
        ledOnMs: 1000,
        enableLights: true);
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterNotificationPlugin.showWeeklyAtDayAndTime(
      4,
      'El Open Mic está comenzando',
      'Dale aquí para escuchar el programa.',
      Day.monday,
      time,
      platformChannelSpecifics,
      payload: "El programa está por comenzar.",
    );
    await flutterNotificationPlugin.showWeeklyAtDayAndTime(
      4,
      'El Open Mic está comenzando',
      'Dale aquí para escuchar el programa.',
      Day.tuesday,
      time,
      platformChannelSpecifics,
      payload: "El programa está por comenzar.",
    );
    await flutterNotificationPlugin.showWeeklyAtDayAndTime(
      4,
      'El Open Mic está comenzando',
      'Dale aquí para escuchar el programa.',
      Day.wednesday,
      time,
      platformChannelSpecifics,
      payload: "El programa está por comenzar.",
    );
    await flutterNotificationPlugin.showWeeklyAtDayAndTime(
      4,
      'El Open Mic está comenzando',
      'Dale aquí para escuchar el programa.',
      Day.thursday,
      time,
      platformChannelSpecifics,
      payload: "El programa está por comenzar.",
    );
  }
}
