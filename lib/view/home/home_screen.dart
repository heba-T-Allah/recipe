import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration/resources/constants_manager.dart';
import 'package:registration/view/home/widgets/cards_title.dart';
import 'package:registration/view/home/widgets/coulmn_card.dart';
import 'package:registration/view/home/widgets/row_card.dart';
import 'package:registration/view/home/widgets/search_and_filter.dart';

import '../../model/recipe.dart';
import '../../model/recipe_ad.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_style.dart';
import '../costom/shared_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CarouselController buttonCarouselController;

  var currentPos = 0;
  List<RecipeAd> adsList = [];
  List<Recipe> recipeList = [];

  void getAdsAndRecipes() async {
    var data = await rootBundle.loadString('assets/data/sample.json');
    var adsDataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(data)['ads']);
    var recipeDataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(data)['recipe']);
    adsList = adsDataDecoded.map((e) => RecipeAd.fromJson(e)).toList();
    recipeList = recipeDataDecoded.map((e) => Recipe.fromJson(e)).toList();
// print(recipeList[2].favorite);
    setState(() {});
  }

  @override
  void initState() {
    buttonCarouselController = CarouselController();
    getAdsAndRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sharedFunctions = SharedFunctions(context: context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20),
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
              width: 20,
              height: 20,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
        child: SingleChildScrollView(
          child: adsList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      child: Text(
                        "Bonjour Emma",
                        style: TextStyles.textStyleRegular13Grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.whatWouldYouLikeToCook,
                      style: TextStyles.textStyleAbrilRegular20Black
                          .copyWith(height: 1.5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SearchAndFilter(),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        CarouselSlider(
                          items: adsList
                              .map((recipeAd) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Stack(
                                      children: [
                                        Center(
                                            child: Image.asset(
                                          recipeAd.image!,
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black38,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                recipeAd.title.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * .3,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.8,
                            initialPage: currentPos,
                            aspectRatio: 2,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, _) {
                              currentPos = index;

                              setState(() {});
                            },
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 500),
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
                                  size: 50,
                                ),
                                onPressed: () async {
                                  await buttonCarouselController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInCubic);
                                })),
                        Positioned(
                          top: 80,
                          left: 4,
                          child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 50,
                              ),
                              onPressed: () async {
                                await buttonCarouselController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInCubic);
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: DotsIndicator(
                        onTap: (position) async {
                          setState(() => currentPos = position);

                          await buttonCarouselController
                              .animateToPage(currentPos);
                        },
                        dotsCount: adsList.length,
                        position: currentPos,
                        decorator: const DotsDecorator(
                          color: Colors.grey, // Inactive color
                          activeColor: Colors.redAccent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CardsTitle(title: AppStrings.todayFresh),
                    const SizedBox(
                      height: 20,
                    ),
                    RowCards(recipeList: recipeList),
                    const SizedBox(
                      height: 20,
                    ),
                    CardsTitle(title: AppStrings.recommended),
                    const SizedBox(
                      height: 10,
                    ),
                    ColumnCards(recipeList: recipeList),
                  ],
                ),
        ),
      ),
    );
  }
}
