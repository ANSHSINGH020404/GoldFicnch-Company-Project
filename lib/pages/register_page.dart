import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/buttton.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final conformPasswordTextController = TextEditingController();

  //signup method
  void signUp() async {
    //loading circle;
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //make sure password is matched;
    if (passwordTextController.text != conformPasswordTextController.text) {
      Navigator.pop(context);
      displayMessage("Password not match!");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
          if(context.mounted) Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("message"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 245, 255, 25),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              //logo
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(
                height: 25,
              ),

              Text("Welcome back,you've been missed"),

              SizedBox(
                height: 25,
              ),

              MyTextField(
                controller: emailTextController,
                hintText: "Email",
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),

              MyTextField(
                controller: passwordTextController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: conformPasswordTextController,
                hintText: "Conform Password",
                obscureText: true,
              ),

              SizedBox(
                height: 10,
              ),

              //signup button
              MyButton(onTap: signUp, text: 'Sign Up'),

              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have a account?"),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login here",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
