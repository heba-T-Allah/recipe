import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';
import 'services/preferences.service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // FlutterNativeSplash.remove();
  try {
    PreferencesService.prefs = await SharedPreferences.getInstance();
    if (PreferencesService.prefs != null) {
      print("preferences init successfully ");
    }
  } catch (e) {
    print("can't init preferences ${e} ");
  }

  runApp(MyApp());
}
