import 'package:flutter/material.dart';
import 'package:registration/routing/app-router.dart';
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
      // theme: ThemeData(
      //     inputDecorationTheme: InputDecorationTheme(
      //       filled: true,
      //       fillColor: Colors.grey.shade200,
      //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      //     ),
      //     colorScheme: ColorScheme.fromSeed(
      //       seedColor: ColorManager.primaryColor,
      //       primary: ColorManager.primaryColor,
      //       secondary: ColorManager.primaryColor,
      //     )),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
