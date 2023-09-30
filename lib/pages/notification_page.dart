import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatelessWidget {
  // const NotificationPage({super.key});
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void showLocalNotification() async {
    //2
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    //1
    _flutterLocalNotificationsPlugin.show(
      0,
      "HOLA DESDE FLUTTER",
      "BODY DESDE FLUTTER",
      NotificationDetails(
        android: AndroidNotificationDetails(
          "Canal prueba id",
          "Canal prueba",
          priority: Priority.max,
          enableVibration: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text("Bituducacuibes"),
          onPressed: () {
            showLocalNotification();
          },
        ),
      ),
    );
  }
}
