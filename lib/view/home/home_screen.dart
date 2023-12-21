import 'package:flutter/material.dart';


import '../../resources/strings_manager.dart';
import '../../resources/text_style.dart';
import '../costom/shared_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedFunctions = SharedFunctions(context: context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.homeScreen),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            sharedFunctions.logoutUser();
          },
          color: Colors.red,
          child: Text(
            AppStrings.logOut,
            style: TextStyles.textStyleRegular16White,
          ),
        ),
      ),
    );
  }
}
