import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_assignment_axis/features/home/data/datasource/home_data_source.dart';
import 'package:movie_assignment_axis/features/home/data/model/popular_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/general_mockups/general_mockups.mocks.dart';
import 'home_data_source_values.dart';

void main() {
  late MockDio mockDio;
  late HomeDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = HomeDataSourceImpl(mockDio);
  });
  test('HomeDataSource test', () async {
    when(mockDio.get(
      '${popularValues.path}?language=en-US&page=1',
    )).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: popularValues.successfulResponse,
        statusCode: 200,
        requestOptions: RequestOptions(path: popularValues.path),
      ),
    );

    final result = await dataSource.getPopulars();
    expect(result, isA<List<PopularModel>>());
  });
}
