
import 'package:flutter/material.dart';

import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';

class MyRatingBar extends StatelessWidget {
  const MyRatingBar({
    super.key,
    required this.recipeList,
    required this.index
  });

  final List<Recipe> recipeList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          recipeList[index].rating! >= 1
              ? Icons.star
              : Icons.star_border,
          color: ColorManager.primaryColor,
        ),
        Icon(
          recipeList[index].rating! >= 2
              ? Icons.star
              : Icons.star_border,
          color: recipeList[index].rating! < 2
              ? ColorManager.greyText
              : ColorManager.primaryColor,
        ),
        Icon(
          recipeList[index].rating! >= 3
              ? Icons.star
              : Icons.star_border,
          color: recipeList[index].rating! < 3
              ? ColorManager.greyText
              : ColorManager.primaryColor,
        ),
        Icon(
          recipeList[index].rating! >= 4
              ? Icons.star
              : Icons.star_border,
          color: recipeList[index].rating! < 4
              ? ColorManager.greyText
              : ColorManager.primaryColor,
        ),
        Icon(
          recipeList[index].rating! == 5
              ? Icons.star
              : Icons.star_border,
          color: recipeList[index].rating! < 5
              ? ColorManager.greyText
              : ColorManager.primaryColor,
        ),
        // RatingBar.builder(
        //   initialRating: recipeList[index].rating!,
        //   minRating: 1,
        //   direction: Axis.horizontal,
        //   allowHalfRating: true,
        //   itemCount: 5,
        //   itemBuilder: (context, _) => Icon(
        //     Icons.star,
        //     color: ColorManager.primaryColor,
        //   ),
        //   onRatingUpdate: (rating) {
        //     print(rating);
        //   },
        // ),

      ],
    );
  }
}
