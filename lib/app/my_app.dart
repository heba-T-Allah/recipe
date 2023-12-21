import 'package:flutter/material.dart';
import 'package:registration/routing/app-router.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import '../routing/routes.dart';

class MyApp extends StatefulWidget {


 MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
        );
  }

}
