import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/palette.dart';
import '../../dashboard/screens/home_screen.dart';
import '../controllers/auth_controller.dart';

class LoginButton extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
          onPressed: () async {
            await authController.authenticateWithBiometrics();
            if (authController.authorized == 'Authorized') {
              Get.offAll(() => const HomeScreen());
            }
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width - 70, 50),
              backgroundColor: Palette.primaryColor),
          child: Obx(() => Text(
                authController.isAuthenticating
                    ? 'Authenticating...'
                    : 'Unlock App',
                style: const TextStyle(fontSize: 18),
              ))),
    );
  }
}
