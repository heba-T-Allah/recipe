import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/resources/strings_manager.dart';

import '../../resources/text_style.dart';
import '../../resources/values_manager.dart';
import '../app_bar/my_app_bar.dart';
import '../drawer/my_drawer.dart';
import '../home/widgets/recommended_list.dart';
import '../home/widgets/search_and_filter.dart';
import 'logic/cubit/recently_viewed_cubit.dart';

class RecentlyViewedScreen extends StatelessWidget {
  RecentlyViewedScreen({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecentlyViewedCubit>(context).getRecentlyViewedRecipes();
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
              Text(AppStrings.recentlyViewed,
                  style: TextStyles.textStyleRegular26Black),
              const SizedBox(
                height: AppSize.s10,
              ),
              const SearchAndFilter(),
              const SizedBox(
                height: AppSize.s10,
              ),
              BlocBuilder<RecentlyViewedCubit, RecentlyViewedState>(
                  builder: (context, state) {
                if (state is RecentlyViewedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is RecentlyViewedSuccess) {
                  return RecommendedRecipeList(
                      recipeList: state.recentlyViewedList);
                } else if (state is RecentlyViewedFailure) {
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
