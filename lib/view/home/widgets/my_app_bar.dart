
import 'package:flutter/material.dart';
import 'package:registration/resources/constants_manager.dart';

import '../../../resources/assets_manager.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    super.key,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding),
        child: Image.asset(
          ImageAssets.menuIcon,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalPadding),
          child: Image.asset(
            ImageAssets.notificationsIcon,
            color: Colors.black,
            width: 20,
            height: 20,
          ),
        )
      ],
    );
  }
}