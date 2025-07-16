import 'package:dartz/dartz.dart';
import 'package:movie_assignment_axis/core/database/populars_database.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/data/datasource/home_data_source.dart';
import 'package:movie_assignment_axis/features/home/data/model/popular_model.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/repo/home_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource _datasource;
  final PopularsHiveCache _cache = PopularsHiveCache();

  HomeRepoImpl(this._datasource);

  @override
  Future<Either<MyServerFailure, List<Popular>>> getPopulars({int page = 1}) async {
    try {
      final connection = await Connectivity().checkConnectivity();
      if (connection.contains(ConnectivityResult.none)) {
        final cached = await _cache.getPopulars();
        return right(cached);
      }

      List<PopularModel> populars = await _datasource.getPopulars(page: page);
      await _cache.savePopulars(populars);
      return right(populars);
    } on MyServerException catch (e) {
      return left(MyServerFailure(e));
    }
  }

}
