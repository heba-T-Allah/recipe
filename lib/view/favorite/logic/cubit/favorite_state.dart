part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  List<Recipe> favoriteList = [];

  FavoriteSuccess({required this.favoriteList});
}

class FavoriteFailure extends FavoriteState {}
