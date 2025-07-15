import 'package:dartz/dartz.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/repo/home_repo.dart';

class GetPopularsUseCase {
  final HomeRepo _repository;

  GetPopularsUseCase(this._repository);

  Future<Either<MyServerFailure, List<Popular>>> call(
      {required int page}) async {
    return await _repository.getPopulars(page: page);
  }
}
