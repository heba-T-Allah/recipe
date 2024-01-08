import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../model/recipe.dart';
import '../../../../model/recipe_ad.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial());
  // List<RecipeAd> adsList = [];
  // List<Recipe> recipeList = [];

  void getAdsAndRecipes() async {
    emit( RecipeLoading());
    try {
      var data = await rootBundle.loadString('assets/data/sample.json');
      var adsDataDecoded =
      List<Map<String, dynamic>>.from(jsonDecode(data)['ads']);
      var recipeDataDecoded =
      List<Map<String, dynamic>>.from(jsonDecode(data)['recipe']);
      List<RecipeAd> adsList = adsDataDecoded.map((e) => RecipeAd.fromJson(e)).toList();
      List<Recipe> recipeList = recipeDataDecoded.map((e) => Recipe.fromJson(e)).toList();
      emit(RecipeSuccess(adsList: adsList,recipeList: recipeList));

    }catch(e){
      emit(RecipeFailure());
    }
// print(recipeList[2].favorite);
//     setState(() {});
  }
}
