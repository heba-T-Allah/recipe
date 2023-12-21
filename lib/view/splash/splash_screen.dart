import 'dart:async';
import 'package:flutter/material.dart';
import 'package:registration/resources/constants_manager.dart';
import 'package:registration/resources/strings_manager.dart';
import 'package:registration/resources/text_style.dart';
import 'package:registration/resources/values_manager.dart';
import 'package:registration/services/preferences.service.dart';
import 'package:registration/view/splash/widgets/splash_logo_and_title.dart';
import '../../resources/assets_manager.dart';
import '../../routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isLoggedIn;

  _startDelay() {
    getValidateData().whenComplete(() {
      Timer(const Duration(seconds: AppConstants.splashDelay), () => _goNext());
    });
  }

  _goNext() {
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
    }
  }

  Future getValidateData() async {
    isLoggedIn = PreferencesService.retrieveBoolValueIsLoggedIn();

    print("loggedIn splash $isLoggedIn");
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
      child: SplashLogoAndTitle(
          height: height,
          width: width,
          mainAxisAlignment: MainAxisAlignment.center,
          textTitle: AppStrings.splashTitle),
    ));
  }
}
