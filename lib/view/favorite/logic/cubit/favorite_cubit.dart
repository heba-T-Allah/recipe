import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../model/recipe.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void getFavoriteRecipes() async {
    emit(FavoriteLoading());
    try {
      var data = await rootBundle.loadString('assets/data/sample.json');

      var recipeDataDecoded =
          List<Map<String, dynamic>>.from(jsonDecode(data)['recipe']);
      List<Recipe> recipeList =
          recipeDataDecoded.map((e) => Recipe.fromJson(e)).toList();
      List<Recipe> favoriteList = recipeList.where((e) => e.favorite!).toList();
      emit(FavoriteSuccess(favoriteList: favoriteList));
    } catch (e) {
      emit(FavoriteFailure());
    }
  }
}
