part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetPopularsLoading extends HomeState {}

final class GetPopularsLoaded extends HomeState {
  final List<Popular> populars;

  GetPopularsLoaded(this.populars);

}

final class GetPopularsFailure extends HomeState {
  final MyServerFailure failure;

  GetPopularsFailure(this.failure);
}

final class HomeFailure extends HomeState {
  final MyServerFailure failure;

  HomeFailure(this.failure);
}

final class ChangeDownloadingState extends HomeState {
  final bool isDownloading;

  ChangeDownloadingState(this.isDownloading);
}

final class PermissionDenied extends HomeState {}

final class ErrorSavingFile extends HomeState {
  final Object error;

  ErrorSavingFile(this.error);
}

final class ImageSavedState extends HomeState {
  final String imagePath;

  ImageSavedState(this.imagePath);
}
