import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsHelper {
  static Future<void> ScheduleNotifications(
      FlutterLocalNotificationsPlugin flutterNotificationPlugin) async {
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
