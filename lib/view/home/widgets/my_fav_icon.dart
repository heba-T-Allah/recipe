

import 'package:flutter/material.dart';

import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';

class MyFavIcon extends StatelessWidget {
  const MyFavIcon({
    super.key,
    required this.recipeList,
    required this.index
  });

  final List<Recipe> recipeList;
final int index;
  @override
  Widget build(BuildContext context) {
    return Icon(
      recipeList[index].favorite == true
          ? Icons.favorite
          : Icons.favorite_border,
      color: recipeList[index].favorite == true
          ? ColorManager.primaryColor
          : ColorManager.greyText,
    );
  }
}
