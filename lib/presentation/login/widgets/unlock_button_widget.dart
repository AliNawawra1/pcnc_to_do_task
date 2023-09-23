import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/palette.dart';

import '../../dashbord/screens/home_screen.dart';
import '../controllers/auth_controller.dart';

Padding UnLockButtonWidget(BuildContext context) {
  final AuthController authController = Get.put(AuthController());

  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: ElevatedButton(
      onPressed: () async {
        await authController.authenticateWithBiometrics();
        if (authController.authorized == 'Authorized') {
          Get.offAll(() => HomeScreen());
        }
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width - 70, 50),
          backgroundColor: Palette.primaryColor),
      child: Obx(
        () => Text(
            authController.isAuthenticating
                ? 'Authenticating...'
                : 'Unlock App',
            style: const TextStyle(fontSize: 18)),
      ),
    ),
  );
}
