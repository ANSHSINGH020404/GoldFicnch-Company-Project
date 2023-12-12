import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void notifiyMessage() {
    Navigator.pushNamed(context, '/notification_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.grey[900],
        actions: [
          //SignOut Button
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
          IconButton(
              onPressed: notifiyMessage,
              icon: const Icon(Icons.notification_add))
        ],
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
