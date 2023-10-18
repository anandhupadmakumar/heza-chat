import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heza_chat/controller/chat/chat_controller.dart';
import 'package:heza_chat/core/constants.dart';

class MessageTileBubble extends StatelessWidget {
  final DocumentSnapshot document;
  const MessageTileBubble({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return Container(
      alignment:
          (data['senderId'] == chatController.firebaseAuth.currentUser?.uid)
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        decoration: BoxDecoration(
            color: (data['senderId'] ==
                    chatController.firebaseAuth.currentUser?.uid)
                ? Colors.blueGrey
                : Colors.blueGrey.shade900,
            borderRadius: BorderRadius.only(
                topLeft: (data['senderId'] ==
                        chatController.firebaseAuth.currentUser?.uid)
                    ? const Radius.circular(16)
                    : const Radius.circular(0),
                topRight: (data['senderId'] ==
                        chatController.firebaseAuth.currentUser?.uid)
                    ? const Radius.circular(0)
                    : const Radius.circular(16),
                bottomLeft: const Radius.circular(16),
                bottomRight: const Radius.circular(16))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            size15,
            Text(
              data['message'],
              style: const TextStyle(color: Colors.white),
            ),
            size15,
          ],
        ),
      ),
    );
  }
}
