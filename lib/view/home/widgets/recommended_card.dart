import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/prep_time_and_serving.dart';

import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';
import '../../../resources/values_manager.dart';
import 'my_fav_icon.dart';
import 'my_rating_bar.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              recipe.image!,
              height: AppSize.s80,
              width: AppSize.s80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(recipe.mealType!,
                        style: TextStyles.textStyleMedium10Blue),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Text(recipe.title!,
                        style: TextStyles.textStyleMedium14Black),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p8),
                      child: Row(
                        children: [
                          MyRatingBar(
                            rate: recipe.rating!,
                          ),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          Text(
                            "${recipe.calories!} Calories",
                            style: TextStyles.textStyleRegular10Orange,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    PrepTimeAndServing(
                        prepTime: recipe.prepTime!, serving: recipe.serving!),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p20, left: AppPadding.p20),
              child: Align(
                alignment: Alignment.topRight,
                child: MyFavIcon(favourite: recipe.favorite!),
              ),
            ),
          ],
        ));
  }
}
