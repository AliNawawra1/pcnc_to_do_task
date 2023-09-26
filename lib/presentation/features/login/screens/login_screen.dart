import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/keys/assets_keys.dart';
import '../../../../core/constants/palette.dart';
import '../widgets/unlock_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Palette.bgColor,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  AssetsKeys.getAssetPath(
                      AssetsKeys.APP_LOGO, AssetsKeys.ICONS_SUB),
                  height: 100,
                  width: 100,
                ),
              ),
              UnLockButtonWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
