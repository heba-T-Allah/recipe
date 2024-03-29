
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/values_manager.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.closeDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openDrawer();
            //open drawer, if drawer is closed
          }
        },
        icon: Image.asset(
          ImageAssets.menuIcon,
          color: Colors.black,
          fit: BoxFit.cover,
          width: 15,
          height: 15,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalPadding),
          child: Image.asset(
            ImageAssets.notificationsIcon,
            color: Colors.black,
            width: AppSize.s20,
            height: AppSize.s20,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
