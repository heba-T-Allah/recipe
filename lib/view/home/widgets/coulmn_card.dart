import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/prep_time_and_serving.dart';
import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';
import 'my_fav_icon.dart';
import 'my_rating_bar.dart';

class ColumnCards extends StatelessWidget {
  const ColumnCards({
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
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .27,
            child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: ColorManager.backgroundGreyColor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      recipeList[index].image!,
                      height: 80,
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recipeList[index].mealType!,
                                style: TextStyles.textStyleMedium10Blue),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(recipeList[index].title!,
                                style: TextStyles.textStyleMedium14Black),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  MyRatingBar(
                                    recipeList: recipeList,
                                    index: index,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${recipeList[index].calories!} Calories",
                                    style: TextStyles.textStyleRegular10Orange,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            PrepTimeAndServing(
                                recipeList: recipeList, index: index),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: MyFavIcon(recipeList: recipeList,index: index),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
