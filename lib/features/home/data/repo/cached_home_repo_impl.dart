import 'package:dartz/dartz.dart';
import 'package:movie_assignment_axis/core/database/populars_database.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/repo/home_repo.dart';

class CachedHomeRepoImpl extends HomeRepo {
  final PopularsHiveCache _cache;

  CachedHomeRepoImpl(this._cache);

  @override
  Future<Either<MyServerFailure, List<Popular>>> getPopulars(
      {int page = 1}) async {
    try {
      final cached = await _cache.getPopulars();
      return right(cached);
    } on MyServerException catch (e) {
      return left(MyServerFailure(e));
    }
  }
}
