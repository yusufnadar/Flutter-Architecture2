import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_mert_album/core/consts/app.dart';
import 'package:real_mert_album/core/consts/colors.dart';
import 'package:real_mert_album/core/consts/fonts.dart';
import 'package:real_mert_album/ui/widgets/custom_input.dart';
import 'package:real_mert_album/utils/extensions/padding.dart';

import '../../../data/controller/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          CustomInput(controller: emailController, hintText: 'Email'),
          SizedBox(height: Get.height * 0.02),
          CustomInput(controller: passwordController, hintText: 'Password'),
          SizedBox(height: Get.height * 0.02),
          SizedBox(
            width: Get.width,
            height: Get.height * 0.07,
            child: ElevatedButton(
              onPressed: () {
                authController.login(
                  email: emailController.text,
                  password: passwordController.text
                );
              },
              child: Text(
                'Login',
                style: Fonts.regularTextStyle(
                  fontSize: 20,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          )
        ],
      ).horizontal(),
    );
  }
}
