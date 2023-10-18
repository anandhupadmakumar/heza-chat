import 'package:flutter/material.dart';
import 'package:heza_chat/controller/chat/chat_controller.dart';
import 'package:heza_chat/view/login/widgets/my_text_field.dart';

class BottomMessageInput extends StatelessWidget {
  final String receiverId;
  final String message;
  const BottomMessageInput(
      {super.key, required this.receiverId, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MyTextField(
                controller: chatController.messageControler,
                color: Colors.white,
                hintText: 'enter your message',
                maxLine: 10000,
                obsequreText: false)),
        IconButton(
            onPressed: () {
              chatController.sendMessage(
                receiverId: receiverId,
              );
            },
            icon: Icon(
              Icons.send,
              color: Colors.white,
              size: 40,
            ))
      ],
    );
  }
}
