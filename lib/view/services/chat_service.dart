import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heza_chat/model/message.dart';

class ChatService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage(
      {required String receiverId, required String message}) async {
    final String currentUserId = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);
    List<String> idList = [currentUserId, receiverId];
    idList.sort();
    String chatRoomId = idList.join('_');
    await firebaseFirestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());

  }

  Stream<QuerySnapshot> getMessages(
      {required String userId, required String receiverUserId}) {
    List<String> ids = [userId, receiverUserId];
    ids.sort();
    String chatRoomId = ids.join('_');
    return firebaseFirestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
