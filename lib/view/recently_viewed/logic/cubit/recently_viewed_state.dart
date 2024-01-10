part of 'recently_viewed_cubit.dart';

@immutable
abstract class RecentlyViewedState {}

class RecentlyViewedInitial extends RecentlyViewedState {}

class RecentlyViewedLoading extends RecentlyViewedState {}

class RecentlyViewedSuccess extends RecentlyViewedState {
  List<Recipe> recentlyViewedList = [];

  RecentlyViewedSuccess({required this.recentlyViewedList});
}

class RecentlyViewedFailure extends RecentlyViewedState {}