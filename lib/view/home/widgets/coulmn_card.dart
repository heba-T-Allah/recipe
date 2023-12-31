import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/prep_time_and_serving.dart';
import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';
import '../../../resources/values_manager.dart';
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
      // height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        itemCount: recipeList.length,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * .27,
            child: Card(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                color: ColorManager.backgroundGreyColor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s30),
                    borderSide: BorderSide.none),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      recipeList[index].image!,
                      height: AppSize.s80,
                      width: AppSize.s80,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(recipeList[index].mealType!,
                                style: TextStyles.textStyleMedium10Blue),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            Text(recipeList[index].title!,
                                style: TextStyles.textStyleMedium14Black),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p8),
                              child: Row(
                                children: [
                                  MyRatingBar(
                                    recipeList: recipeList,
                                    index: index,
                                  ),
                                  const SizedBox(
                                    width: AppSize.s10,
                                  ),
                                  Text(
                                    "${recipeList[index].calories!} Calories",
                                    style: TextStyles.textStyleRegular10Orange,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s10,
                            ),
                            PrepTimeAndServing(
                                recipeList: recipeList, index: index),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppPadding.p20, left: AppPadding.p20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: MyFavIcon(recipeList: recipeList, index: index),
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
