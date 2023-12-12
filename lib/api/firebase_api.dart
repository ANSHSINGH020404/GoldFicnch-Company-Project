import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:goldfinch/main.dart';

class FirebaseApi {
  //create a instance of firebase Messaging..
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    //request permission from user (will propt user)
    await _firebaseMessaging.requestPermission();
    // fetch the fom token for this device
    final fCMToken = await _firebaseMessaging.getToken();
    print(
      'Token: $fCMToken',
    );
    initPushNotification();
  }

  //funtion to handle recevied message
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorkey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
