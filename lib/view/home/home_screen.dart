import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/resources/constants_manager.dart';
import 'package:registration/view/home/logic/cubit/recipe_cubit.dart';
import 'package:registration/view/home/widgets/cards_title.dart';
import 'package:registration/view/home/widgets/fresh_recipe_list.dart';
import 'package:registration/view/home/widgets/recommended_list.dart';
import 'package:registration/view/home/widgets/search_and_filter.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_style.dart';
import '../../resources/values_manager.dart';
import '../costom/shared_functions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

 final CarouselController buttonCarouselController = CarouselController();
  var currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final sharedFunctions = SharedFunctions(context: context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Image.asset(
            ImageAssets.menuIcon,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            child: Image.asset(
              ImageAssets.notificationsIcon,
              color: Colors.black,
              width: AppSize.s20,
              height: AppSize.s20,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding),
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red)),
          onPressed: () {
            sharedFunctions.logoutUser();
          },
          child: Text(
            AppStrings.logOut,
            style: TextStyles.textStyleRegular16White,
          ),
        ),
      ),
      body: BlocConsumer<RecipeCubit, RecipeState>(
        builder: (context, state) {
          BlocProvider.of<RecipeCubit>(context).getAdsAndRecipes();
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
                          Stack(
                            children: [
                              CarouselSlider(
                                items: state.adsList
                                    .map((recipeAd) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: AppMargin.m8),
                                          child: Stack(
                                            children: [
                                              Center(
                                                  child: Image.asset(
                                                recipeAd.image!,
                                              )),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    AppPadding.p8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black38,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppSize.s20)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            AppPadding.p8),
                                                    child: Text(
                                                        recipeAd.title
                                                            .toString(),
                                                        style: TextStyles
                                                            .textStyleRegular16White),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 0.8,
                                  initialPage: currentPos,
                                  aspectRatio: 2,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  onPageChanged: (index, _) {
                                    currentPos = index;

                                    // setState(() {});
                                  },
                                  autoPlayAnimationDuration: const Duration(
                                      milliseconds:
                                          AppConstants.carouselDuration),
                                  autoPlayCurve: Curves.easeInCubic,
                                ),
                              ),
                              Positioned(
                                  top: 80,
                                  right: 4,
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: AppSize.s50,
                                      ),
                                      onPressed: () async {
                                        await buttonCarouselController.nextPage(
                                            duration: const Duration(
                                                milliseconds: AppConstants
                                                    .carouselDuration),
                                            curve: Curves.easeInCubic);
                                      })),
                              Positioned(
                                top: 80,
                                left: 4,
                                child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: AppSize.s50,
                                    ),
                                    onPressed: () async {
                                      await buttonCarouselController
                                          .previousPage(
                                              duration: const Duration(
                                                  milliseconds: AppConstants
                                                      .carouselDuration),
                                              curve: Curves.easeInCubic);
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s15),
                          Center(
                            child: DotsIndicator(
                              onTap: (position) async {
                                // setState(() => currentPos = position);

                                await buttonCarouselController
                                    .animateToPage(currentPos);
                              },
                              dotsCount: state.adsList.length,
                              position: currentPos,
                              decorator: const DotsDecorator(
                                color: Colors.grey, // Inactive color
                                activeColor: Colors.redAccent,
                              ),
                            ),
                          ),
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
          // return const Center();
        },
        listener: (BuildContext context, RecipeState state) {},
      ),
    );
  }
}
