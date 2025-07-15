import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/usecase/get_populars_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getPopularsUseCase) : super(HomeInitial());

  final GetPopularsUseCase _getPopularsUseCase;

  List<Popular> populars = [];

  void getPopulars({int page = 1}) async {
    emit(GetPopularsLoading());
    final result = await _getPopularsUseCase.call(page: page);
    result.fold(
      (failure) async {
        emit(HomeFailure(failure));
      },
      (returnedPopulars) {
        populars.addAll(returnedPopulars);
        emit(GetPopularsLoaded());
      },
    );
  }
}
