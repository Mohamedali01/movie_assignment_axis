import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/data/repo/cached_home_repo_impl.dart';
import 'package:movie_assignment_axis/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/repo/home_repo.dart';

class SmartHomeRepoImpl extends HomeRepo {
  final HomeRepoImpl remoteRepo;
  final CachedHomeRepoImpl cachedRepo;
  final Connectivity connectivity;

  SmartHomeRepoImpl(
      {required this.remoteRepo,
      required this.cachedRepo,
      required this.connectivity});

  @override
  Future<Either<MyServerFailure, List<Popular>>> getPopulars(
      {int page = 1}) async {
    final connection = await connectivity.checkConnectivity();
    if (connection.contains(ConnectivityResult.none)) {
      return await cachedRepo.getPopulars(page: page);
    } else {
      return await remoteRepo.getPopulars(page: page);
    }
  }
}
