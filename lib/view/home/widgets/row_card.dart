import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/my_rating_bar.dart';
import 'package:registration/view/home/widgets/prep_time_and_serving.dart';
import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';
import 'my_fav_icon.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    super.key,
    required this.recipeList,
  });

  final List<Recipe> recipeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        itemCount: recipeList.length,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      color: ColorManager.backgroundGreyColor,
                      // elevation: 2,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20),
                          child: Stack(
                            children: [
                              Positioned(
                                child:MyFavIcon(recipeList: recipeList,index: index),
                              ),
                              Positioned(
                                top: 0,
                                right: -20,
                                child: SizedBox(
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                top: 90,
                                child: Text(
                                  recipeList[index].mealType!,
                                  style: TextStyles.textStyleMedium10Blue,
                                ),
                              ),
                              Positioned(
                                top: 110,
                                child: SizedBox(
                                  width: 160,
                                  child: Text(recipeList[index].title!,
                                      style: TextStyles.textStyleMedium14Black),
                                ),
                              ),
                              Positioned(
                                  top: 140,
                                  child: MyRatingBar(
                                      recipeList: recipeList, index: index)),
                              Positioned(
                                top: 170,
                                child: Text(
                                  "${recipeList[index].calories!} Calories",
                                  style: TextStyles.textStyleRegular10Orange,
                                ),
                              ),
                              Positioned(
                                // bottom: 20,
                                top: 190,
                                child: PrepTimeAndServing(
                                    recipeList: recipeList, index: index),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Positioned(
                right: -10,
                top: -20,
                child: Image.asset(
                  recipeList[index].image!,
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}