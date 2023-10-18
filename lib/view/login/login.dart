import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heza_chat/controller/login/login_controller.dart';
import 'package:heza_chat/view/auth/auth_screen.dart';
import 'package:heza_chat/view/home/home_screen.dart';
import 'package:heza_chat/view/login/widgets/custom_button.dart';
import 'package:heza_chat/view/login/widgets/my_text_field.dart';

import '../../core/constants.dart';
import '../home/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(padding20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login_images.png',
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),

                // const Icon(
                //   Icons.message,
                //   size: 80,
                //   color: Colors.black,
                // ),
                size15,
                const Text(
                  'Welcome',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                size15,
                MyTextField(
                    controller: loginController.loginTextUserNameController,
                    hintText: 'userName',
                    obsequreText: false),
                size15,
                MyTextField(
                    controller: loginController.passwordController,
                    hintText: 'password',
                    obsequreText: true),
                size15,
                CustomButton(
                    btnText: 'login',
                    ontap: () {
                      loginController.signinUser();
                      Get.off(() => AuthScreen());
                    }),
                size15,
                TextButton(
                    onPressed: () {
                      Get.off(() => const RegisterScreen());
                    },
                    child: const Text('Don\'t have an Account?')),

                size15,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
