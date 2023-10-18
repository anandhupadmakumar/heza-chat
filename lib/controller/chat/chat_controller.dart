import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heza_chat/view/services/chat_service.dart';

final ChatController chatController = Get.put(ChatController());

class ChatController extends GetxController {
  final TextEditingController messageControler = TextEditingController();

  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void sendMessage({
    required receiverId,
  }) async {
    if (messageControler.text.isNotEmpty) {
      await chatService.sendMessage(
          receiverId: receiverId, message: messageControler.text);
      messageControler.clear();
    }
  }
}
