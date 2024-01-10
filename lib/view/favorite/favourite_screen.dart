import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/resources/strings_manager.dart';
import 'package:registration/view/favorite/logic/cubit/favorite_cubit.dart';
import '../../resources/text_style.dart';
import '../../resources/values_manager.dart';
import '../app_bar/my_app_bar.dart';
import '../drawer/my_drawer.dart';
import '../home/widgets/recommended_list.dart';
import '../home/widgets/search_and_filter.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoriteCubit>(context).getFavoriteRecipes();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MyAppBar(scaffoldKey: scaffoldKey),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p8, left: AppPadding.p20, right: AppPadding.p20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.favorites, style: TextStyles.textStyleRegular26Black),
              const SizedBox(
                height: AppSize.s10,
              ),
              const SearchAndFilter(),
              const SizedBox(
                height: AppSize.s10,
              ),
              BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                if (state is FavoriteLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FavoriteSuccess) {
                  return RecommendedRecipeList(recipeList: state.favoriteList);
                } else if (state is FavoriteFailure) {
                  return const Center(
                    child: Text(AppStrings.somethingWentWrong),
                  );
                } else {
                  return const Center(
                    child: Text(AppStrings.thereIsNoData),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
