import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

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
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  var currentPos = 0;

  @override
  void initState() {
    buttonCarouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sharedFunctions = SharedFunctions(context: context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.homeScreen),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Stack(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Container(
                        // margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                            child: Image.network(e,
                                fit: BoxFit.cover, width: 1000.0)),
                      ))
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .3,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.8,
                enableInfiniteScroll: false,
                viewportFraction: 0.75,
                initialPage: currentPos,
                aspectRatio: 2,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, _) {
                  currentPos = index;

                  setState(() {});
                },
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.easeInCubic,
              ),
            ),
            Positioned(
                top: 80,
                right: 4,
                child: Container(
                  // color: Colors.grey,
                  // height: 60,
                  // width: 60,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 50,
                      ),
                      onPressed: () async{
                     await   buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInCubic);
                      }),
                )),
            Positioned(
              top: 80,
              left: 4,
              child: Container(
                  // color: Colors.grey,
                  // height: 60,
                  // width: 60,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 50,
                      ),
                      onPressed: () async{
                      await  buttonCarouselController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInCubic);
                      })),
            ),
            Positioned(
              top: 220,
              right: 40,
              left: 40,
              child: DotsIndicator(
                onTap: (position) async {
                  setState(() => currentPos = position);

                  await buttonCarouselController.animateToPage(currentPos);

                },
                dotsCount: imgList.length,
                position: currentPos,
                decorator: DotsDecorator(
                  color: Colors.black87, // Inactive color
                  activeColor: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(height: 200),
            Positioned(
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    sharedFunctions.logoutUser();
                  },
                  color: Colors.red,
                  child: Text(
                    AppStrings.logOut,
                    style: TextStyles.textStyleRegular16White,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
