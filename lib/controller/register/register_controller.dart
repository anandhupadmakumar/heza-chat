import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/auth/auth_screen.dart';

final RegisterController registerController = Get.put(RegisterController());

class RegisterController extends GetxController {
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void signupUser() async {
    showDialog(
      context: Get.context!,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      if (registerPasswordController.text ==
          registerConfirmPasswordController.text) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        );
        firestore.collection('user').doc(userCredential.user?.uid).set({
          'uid': userCredential.user?.uid,
          'email': userCredential.user?.email,
        });
        Get.back();
        Get.off(() => AuthScreen());
      } else {
        //show error
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-passworc') {}
    }
  }

  signinWithGoogle() async {
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await guser!.authentication;
    final userCredential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(userCredential);
  }
}
