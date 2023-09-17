import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification()async{
    await firebaseMessaging.requestPermission();
    final fCMToken = await firebaseMessaging.getToken();
    print("Day la Token: $fCMToken");
  }
}