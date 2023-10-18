import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heza_chat/view/home/home_screen.dart';
import 'package:heza_chat/view/login/login.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(
              
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
