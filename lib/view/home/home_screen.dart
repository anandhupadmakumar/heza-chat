import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heza_chat/controller/login/login_controller.dart';
import 'package:heza_chat/view/home/widgets/user_list.dart';

class HomeScreen extends StatefulWidget {
  // final User userDetails =   FirebaseAuth.instance.currentUser!;
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () {
                loginController.signoutUser();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: Container(padding: EdgeInsets.all(15), child: UserLIst())),
    );
  }
}
