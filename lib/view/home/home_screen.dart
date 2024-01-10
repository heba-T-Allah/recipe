
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/view/drawer/my_drawer.dart';
import 'package:registration/view/home/logic/cubit/recipe_cubit.dart';
import 'package:registration/view/home/widgets/cards_title.dart';
import 'package:registration/view/home/widgets/fresh_recipe_list.dart';
import 'package:registration/view/home/widgets/my_carousel_slider.dart';
import 'package:registration/view/home/widgets/recommended_list.dart';
import 'package:registration/view/home/widgets/search_and_filter.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_style.dart';
import '../../resources/values_manager.dart';
import '../app_bar/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<RecipeCubit>(context).getAdsAndRecipes();
    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: MyAppBar(scaffoldKey: scaffoldKey),
      drawer: MyDrawer(),
      body: BlocBuilder<RecipeCubit, RecipeState>(builder: (context, state) {
        if (state is RecipeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RecipeSuccess) {
          return Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p20,
                right: AppPadding.p20),
            child: SingleChildScrollView(
              child: state.adsList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s20,
                          child: Text(
                            "Bonjour Emma",
                            style: TextStyles.textStyleRegular13Grey,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Text(
                          AppStrings.whatWouldYouLikeToCook,
                          style: TextStyles.textStyleAbrilRegular20Black
                              .copyWith(height: 1.5),
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        const SearchAndFilter(),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        MyCarouselSlider(adsList: state.adsList,),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        CardsTitle(title: AppStrings.todayFresh),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        FreshRecipeList(recipeList: state.recipeList),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        CardsTitle(title: AppStrings.recommended),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        RecommendedRecipeList(recipeList: state.recipeList),
                      ],
                    ),
            ),
          );
        } else if (state is RecipeFailure) {
          return const Center(
            child: Text("Something went wrong Please try again"),
          );
        } else {
          return const Center(
            child: Text("There is no data"),
          );
        }
      }),
    );
  }
}
