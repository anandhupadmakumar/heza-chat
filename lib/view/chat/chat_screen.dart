import 'package:flutter/material.dart';
import 'package:heza_chat/controller/chat/chat_controller.dart';
import 'package:heza_chat/view/chat/widgets/bottom_message_input.dart';
import 'package:heza_chat/view/chat/widgets/message_tile_bubble.dart';
import 'package:heza_chat/view/chat/widgets/message_tile_list.dart';

class ChatScreen extends StatelessWidget {
  final String recevierEmailId;
  final String recevierUserId;
  const ChatScreen(
      {super.key, required this.recevierEmailId, required this.recevierUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          recevierEmailId,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: MessageTileList(
                  userId: chatController.firebaseAuth.currentUser!.uid,
                  receiverUserId: recevierUserId),
            ),
            BottomMessageInput(
              receiverId: recevierUserId,
              message: chatController.messageControler.text,
            ),
          ],
        ),
      ),
    );
  }
}
