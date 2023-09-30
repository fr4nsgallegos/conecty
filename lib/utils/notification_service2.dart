import 'package:firebase_messaging/firebase_messaging.dart';

//primero sin static
//se pone en static para que se ejecute en el main
class NotificationService2 {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print("rokebn");
    print(token);

    //2
    firebaseMessaging.subscribeToTopic("PEPE");
    firebaseMessaging.subscribeToTopic("PEPE2");

    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static _onMessage(RemoteMessage message) async {
    print("------------------");
    print(message);
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  static Future _onBackgroundMessage(RemoteMessage message) async {
    if (message.notification != null) {
      print("segundo planooooo");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  static Future _onMessageOpenedApp(RemoteMessage message) async {
    if (message.notification != null) {
      print("abiertaaa planooooo");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }
}
