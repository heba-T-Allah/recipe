import 'package:flutter/material.dart';
import 'package:registration/view/home/home_screen.dart';

import '../../utils/navigation.dart';
import '../costom/shared_functions.dart';
import 'my_drawer_header.dart';
import 'my_drawer_item.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int selectedIndex = 0;

  // onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // padding: EdgeInsets.zero,
          children: [
            MyDrawerHeader(),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.home,
              index: 0,
              title: 'Home',
            ),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.favorite_border,
              index: 1,
              title: 'Favorites',
            ),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.play_arrow_outlined,
              index: 2,
              title: 'Recently Viewed',
            ),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.settings,
              index: 3,
              title: 'Settings',
            ),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.info_outline_rounded,
              index: 4,
              title: "About Us",
            ),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.help,
              index: 5,
              title: 'Help',
            ),
            MyDrawerItem(
              selectedIndex: selectedIndex,
              icon: Icons.logout,
              index: 6,
              title: 'Sign Out',
            ),
          ],
        ),
      ),
    );
  }
}
