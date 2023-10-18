import 'package:flutter/material.dart';
import 'package:heza_chat/controller/chat/chat_controller.dart';
import 'package:heza_chat/core/constants.dart';
import 'package:heza_chat/view/chat/widgets/message_tile_bubble.dart';

class MessageTileList extends StatelessWidget {
  final String userId;
  final String receiverUserId;
  const MessageTileList(
      {super.key, required this.userId, required this.receiverUserId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: chatController.chatService
          .getMessages(userId: userId, receiverUserId: receiverUserId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            'error ${snapshot.error}',
            style: const TextStyle(color: Colors.red),
          ));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Text(
            'loading......',
            style: TextStyle(color: Colors.white),
          ));
        }
        return ListView(
          padding: const EdgeInsets.all(padding20),
          children: snapshot.data!.docs
              .map((document) => Column(
                    children: [
                      MessageTileBubble(document: document),
                      size15,
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}
