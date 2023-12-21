import 'package:flutter/material.dart';
import 'package:registration/routing/routes.dart';
import 'package:registration/services/preferences.service.dart';

class SharedFunctions {
  final BuildContext? context;

  const SharedFunctions({required this.context});

  void showInSnackBar(String? value) {
    ScaffoldMessenger.of(context!)
        .showSnackBar(SnackBar(content: Text(value!)));
  }

  void logoutUser() async {
    PreferencesService.clearSharedPreferences();
    Navigator.pushReplacementNamed(context!, Routes.signInScreen);
  }
}
