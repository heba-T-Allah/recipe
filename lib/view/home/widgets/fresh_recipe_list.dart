import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/fresh_recipe_card.dart';
import '../../../model/recipe.dart';


class FreshRecipeList extends StatelessWidget {
  const FreshRecipeList({
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
            child: FreshRecipeCard(recipe: recipeList[index]),
          );
        },
      ),
    );
  }
}
