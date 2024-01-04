import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/prep_time_and_serving.dart';

import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';
import '../../../resources/values_manager.dart';
import 'my_fav_icon.dart';
import 'my_rating_bar.dart';

class RecommendedCardRecipe extends StatelessWidget {
  const RecommendedCardRecipe({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(right: AppMargin.m60),
        color: ColorManager.backgroundGreyColor,
        // elevation: 2,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s30),
            borderSide: BorderSide.none),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .55,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                MyFavIcon(favourite: recipe.favorite!),
                const SizedBox(
                  width: AppSize.s90,
                  height: AppSize.s90,
                ),
                Text(
                  recipe.mealType!,
                  style: TextStyles.textStyleMedium10Blue,
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(recipe.title!,
                      style: TextStyles.textStyleMedium14Black),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                MyRatingBar(
                  rate: recipe.rating!,
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  "${recipe.calories!} Calories",
                  style: TextStyles.textStyleRegular10Orange,
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                PrepTimeAndServing(
                    prepTime: recipe.prepTime!, serving: recipe.serving!),
              ],
            ),
          ),
        ));
  }
}
