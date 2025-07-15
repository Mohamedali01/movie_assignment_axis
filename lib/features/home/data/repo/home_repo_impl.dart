import 'package:dartz/dartz.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/data/datasource/home_data_source.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource _datasource;

  HomeRepoImpl(this._datasource);

  @override
  Future<Either<MyServerFailure, List<Popular>>> getPopulars(
      {int page = 1}) async {
    try {
      List<Popular> populars = await _datasource.getPopulars(page: page);
      return right(populars);
    } on MyServerException catch (e) {
      return left(MyServerFailure(e));
    }
  }
}
