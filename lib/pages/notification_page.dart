import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Column
      (children: [
        Text(message.notification!.title.toString(),style: TextStyle(
         fontWeight: FontWeight.bold,
         color: Colors.black,
         fontSize: 20,
        ),
        ),
        SizedBox(height: 5,),
        Text(message.notification!.body.toString(),),
        // Text(message.data.toString()),
        
  
      ]),
    );
  }
}
