
import 'package:flutter/material.dart';

import '../../../model/recipe.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';

class PrepTimeAndServing extends StatelessWidget {
  const PrepTimeAndServing({
    super.key,
    required this.recipeList,
    required this.index
  });

  final List<Recipe> recipeList;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Row(
          children: [
            Image.asset(
              ImageAssets.timeIcon,
              width: 16,
              height: 16,
              color: ColorManager.greyText,
            ),
            Text(
              "  ${recipeList[index].prepTime! / 60} Min",
              style: TextStyles.textStyleRegular10Grey,
            )
          ],
        ),
        SizedBox(width: 40,),
        Row(
          children: [
            Image.asset(
              ImageAssets.servingIcon,
              width: 16,
              height: 16,
              color: ColorManager.greyText,
            ),
            Text(
              "  ${recipeList[index].serving!} Serving",
              style: TextStyles.textStyleRegular10Grey,
            )
          ],
        ),
      ],
    );
  }
}