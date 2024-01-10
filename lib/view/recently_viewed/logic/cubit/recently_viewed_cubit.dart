import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../model/recipe.dart';

part 'recently_viewed_state.dart';

class RecentlyViewedCubit extends Cubit<RecentlyViewedState> {
  RecentlyViewedCubit() : super(RecentlyViewedInitial());

  void getRecentlyViewedRecipes() async {
    emit(RecentlyViewedLoading());
    try {
      var data = await rootBundle.loadString('assets/data/sample.json');

      var recipeDataDecoded =
      List<Map<String, dynamic>>.from(jsonDecode(data)['recipe']);
      List<Recipe> recipeList =
      recipeDataDecoded.map((e) => Recipe.fromJson(e)).toList();
      emit(RecentlyViewedSuccess(recentlyViewedList: recipeList));
    } catch (e) {
      emit(RecentlyViewedFailure());
    }
  }
}
