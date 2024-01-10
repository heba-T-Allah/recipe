import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/routing/app-router.dart';
import 'package:registration/view/favorite/logic/cubit/favorite_cubit.dart';
import 'package:registration/view/recently_viewed/logic/cubit/recently_viewed_cubit.dart';
import 'package:registration/view/sign_in/logic/cubit/login_cubit.dart';
import '../resources/strings_manager.dart';
import '../routing/routes.dart';
import '../view/home/logic/cubit/recipe_cubit.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RecipeCubit>(
            create: (BuildContext context) => RecipeCubit(),
          ),
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(),
          ),
          BlocProvider<FavoriteCubit>(
            create: (BuildContext context) => FavoriteCubit(),
          ),
          BlocProvider<RecentlyViewedCubit>(
            create: (BuildContext context) => RecentlyViewedCubit(),
          ),
        ],
        child: MaterialApp(
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
        ));
  }
}
