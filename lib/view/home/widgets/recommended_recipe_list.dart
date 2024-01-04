import 'package:flutter/material.dart';

import 'package:registration/view/home/widgets/recommended_card_recipe.dart';
import '../../../model/recipe.dart';

import '../../../resources/values_manager.dart';

class RecommendedRecipeList extends StatelessWidget {
  const RecommendedRecipeList({
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
                  child: RecommendedCardRecipe(recipe: recipeList[index]),
                ),
              ),
              Positioned(
                right: -10,
                top: -20,
                child: Image.asset(
                  recipeList[index].image!,
                  width: AppSize.s150,
                  height: AppSize.s150,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
