import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heza_chat/view/auth/auth_screen.dart';

final loginController = Get.put(LoginController());

class LoginController extends GetxController {
  final TextEditingController loginTextUserNameController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void signinUser() async {
    showDialog(
      context: Get.context!,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginTextUserNameController.text,
              password: passwordController.text);
      firestore.collection('user').doc(userCredential.user?.uid).set({
        'uid': userCredential.user?.uid,
        'email': userCredential.user?.email,
      }, SetOptions(merge: true));

      Get.back();
      loginTextUserNameController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-passworc') {}
    }
  }

  void signoutUser() async {
    await FirebaseAuth.instance.signOut();
    Get.off(() => AuthScreen());
  }
}
