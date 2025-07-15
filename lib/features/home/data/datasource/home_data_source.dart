import 'package:dio/dio.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';
import 'package:movie_assignment_axis/features/home/data/model/popular_model.dart';

import '../../../../core/networking/api_path.dart';

abstract class HomeDataSource {
  Future<List<PopularModel>> getPopulars({int page = 1});
}

class HomeDataSourceImpl implements HomeDataSource {
  final Dio _dio;

  HomeDataSourceImpl(this._dio);

  @override
  Future<List<PopularModel>> getPopulars({int page = 1}) async {
    try {
      final Response response =
          await _dio.get('${ApiPath.getPopulars}?language=en-US&page=$page');
      return (response.data['results'] as List)
          .map((e) => PopularModel.fromJson(e))
          .toList();
    } on MyDioException catch (e) {
      throw MyServerException(e);
    }
  }
}
