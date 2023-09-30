import 'package:firebase_messaging/firebase_messaging.dart';

//primero sin static
//se pone en static para que se ejecute en el main
class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initMessaging() async {
    //tres escenarios
    //app primer plano
    //minimizar segundo plano
    //app cerrada /fallgorund

//envio de notificciones personalizadas
    String token = await firebaseMessaging.getToken() ?? "-";
    FirebaseMessaging.onMessage.listen(_onMessage);

    // print(token);
    //3 PARA ENVIAR NOTIFICACIONES A UN GRUPO SE HACE  CON TOPUIC
  }

  //capturar datos cuando se esta ejecutando la app
  static _onMessage(RemoteMessage message) async {
    print("------------------");
    print(message);
    //2
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }
}
