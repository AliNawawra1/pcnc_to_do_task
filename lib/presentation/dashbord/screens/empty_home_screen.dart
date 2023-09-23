import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/keys/assets_keys.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_screen_floating_button.dart';

class EmptyStateScreen extends StatelessWidget {
  const EmptyStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(taskCount: 0),
      floatingActionButton: const HomeScreenFloatingActionButton(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsKeys.getAssetPath(
                  AssetsKeys.EMPTY_HOME_IMAGE, AssetsKeys.IMAGES_SUB),
            ),
            const SizedBox(height: 50),
            const Text(AppConstants.EMPTY_SCREEN_HINT_1,
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            const Text(AppConstants.EMPTY_SCREEN_HINT_2,
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
