part of 'recipe_cubit.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeSuccess extends RecipeState {
  List<RecipeAd> adsList = [];
  List<Recipe> recipeList = [];

  RecipeSuccess({required this.recipeList, required this.adsList});
}

class RecipeFailure extends RecipeState {}
