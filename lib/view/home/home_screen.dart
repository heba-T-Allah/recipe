import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration/resources/constants_manager.dart';
import 'package:registration/view/home/widgets/cards_title.dart';
import 'package:registration/view/home/widgets/search_and_filter.dart';

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

  void getAds() async {
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
    List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

    adsList = dataDecoded.map((e) => RecipeAd.fromJson(e)).toList();
    print(adsList);
    setState(() {});
  }

  @override
  void initState() {
    buttonCarouselController = CarouselController();
    getAds();
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
          padding:
          EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding),
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
          style: ButtonStyle(
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
              ? Center(child: const CircularProgressIndicator())
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
              SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.whatWouldYouLikeToCook,
                style: TextStyles.textStyleAbrilRegular20Black
                    .copyWith(height: 1.5),
              ),
              SizedBox(
                height: 10,
              ),
              SearchAndFilter(),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  CarouselSlider(
                    items: adsList
                        .map((recipeAd) =>
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .3,
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
                      Duration(milliseconds: 500),
                      autoPlayCurve: Curves.easeInCubic,
                    ),
                  ),
                  Positioned(
                      top: 80,
                      right: 4,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 50,
                          ),
                          onPressed: () async {
                            await buttonCarouselController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInCubic);
                          })),
                  Positioned(
                    top: 80,
                    left: 4,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 50,
                        ),
                        onPressed: () async {
                          await buttonCarouselController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInCubic);
                        }),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: DotsIndicator(
                  onTap: (position) async {
                    setState(() => currentPos = position);

                    await buttonCarouselController
                        .animateToPage(currentPos);
                  },
                  dotsCount: adsList.length,
                  position: currentPos,
                  decorator: DotsDecorator(
                    color: Colors.black87, // Inactive color
                    activeColor: Colors.redAccent,
                  ),
                ),
              ),
              CardsTitle(title: AppStrings.todayFresh),
            ],
          ),
        ),
      ),
    );
  }
}
