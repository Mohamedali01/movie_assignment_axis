import 'package:dartz/dartz.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';

abstract class HomeRepo {
  Future<Either<MyServerFailure, List<Popular>>> getPopulars({int page = 1});
}
