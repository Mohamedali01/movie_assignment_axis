part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetPopularsLoading extends HomeState {}

final class GetPopularsLoaded extends HomeState {}

final class GetPopularsFailure extends HomeState {
  final MyServerFailure failure;

  GetPopularsFailure(this.failure);
}

final class HomeFailure extends HomeState {
  final MyServerFailure failure;

  HomeFailure(this.failure);
}
