import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_assignment_axis/core/database/populars_database.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/data/datasource/home_data_source.dart';
import 'package:movie_assignment_axis/features/home/data/model/film_model.dart';
import 'package:movie_assignment_axis/features/home/data/model/popular_model.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_assignment_axis/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;


import '../../../../core/general_mockups/general_mockups.mocks.dart';
import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeDataSource, Connectivity,PopularsHiveCache])
void main() {
  late MockHomeDataSource mockHomeDataSource;
  late MockConnectivity mockConnectivity;
  late HomeRepoImpl homeRepoImpl;
  late PopularsHiveCache popularsHiveCache;

  setUp(() {
    mockHomeDataSource = MockHomeDataSource();
    mockConnectivity = MockConnectivity();
    popularsHiveCache = PopularsHiveCache();
    homeRepoImpl = HomeRepoImpl(mockHomeDataSource, popularsHiveCache);
    Hive.init("./path");
  });
  test('HomeRepo test', () async {
    when(mockHomeDataSource.getPopulars(page: 1
    )).thenAnswer(
      (_) async => [const PopularModel(
          id: 1,
          name: 'Jason',
          profilePath: '/jason.jpg',
          films: [
            FilmModel(
              id: 1,
              title: 'Film 1',
              posterPath: '/film1.jpg',
            ),
            FilmModel(
              id: 2,
              title: 'Film 2',
              posterPath: '/film2.jpg',
            )

          ]
      ),
        const PopularModel(
            id: 2,
            name: 'Alice',
            profilePath: '/alice.jpg',
            films: [
              FilmModel(
                id: 3,
                title: 'Film 3',
                posterPath: '/film3.jpg',
              ),
              FilmModel(
                id: 4,
                title: 'Film 4',
                posterPath: '/film4.jpg',
              )

            ]
        )
              ]
    );

    when( mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.wifi]);



    final result = await homeRepoImpl.getPopulars(page: 1);
    expect(result, isA<Either<MyServerFailure, List<Popular>>>());
  });
}
