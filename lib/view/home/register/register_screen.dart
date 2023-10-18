import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heza_chat/controller/login/login_controller.dart';
import 'package:heza_chat/view/auth/auth_screen.dart';
import 'package:heza_chat/view/home/home_screen.dart';
import 'package:heza_chat/view/login/login.dart';
import 'package:heza_chat/view/login/widgets/custom_button.dart';
import 'package:heza_chat/view/login/widgets/my_text_field.dart';

import '../../../controller/register/register_controller.dart';
import '../../../core/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(padding20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.black,
                ),
                size15,
                const Text(
                  'Create your Account ',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                size15,
                MyTextField(
                    controller: registerController.registerEmailController,
                    hintText: 'UserName',
                    obsequreText: false),
                size15,
                MyTextField(
                    controller: registerController.registerPasswordController,
                    hintText: 'Password',
                    obsequreText: true),
                size15,
                MyTextField(
                    controller:
                        registerController.registerConfirmPasswordController,
                    hintText: 'Confirm Password',
                    obsequreText: true),
                size15,
                CustomButton(
                    btnText: 'Register',
                    ontap: () {
                      registerController.signupUser();
                    }),
                size15,
                const Text(
                  'OR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                size15,
                InkWell(
                  onTap: () async {
                    await registerController.signinWithGoogle();
                    Get.to(() => AuthScreen());
                  },
                  child: Image.asset(
                    'assets/images/google_icon.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text('Already have an Account?')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
