import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heza_chat/controller/login/login_controller.dart';
import 'package:heza_chat/controller/register/register_controller.dart';
import 'package:heza_chat/core/constants.dart';

import '../../chat/chat_screen.dart';

class UserLIst extends StatelessWidget {
  const UserLIst({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('user').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('loading....');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => BuildListTile(doc: document))
              .toList(),
        );
      },
    );
  }
}

class BuildListTile extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DocumentSnapshot doc;
  BuildListTile({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (auth.currentUser!.email != data['email']) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => ChatScreen(
                    recevierEmailId: data['email'],
                    recevierUserId: data['uid'],
                  ));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(40))),
              child: Text(
                data['email'],
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          size15,
        ],
      );
    } else {
      return Container();
    }
  }
}
