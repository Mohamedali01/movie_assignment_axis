import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/usecase/get_populars_use_case.dart';
import 'package:movie_assignment_axis/features/home/presentation/cubit/home_cubit.dart';
import 'package:dartz/dartz.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetPopularsUseCase])
void main() {
  late HomeCubit cubit;
  late MockGetPopularsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetPopularsUseCase();
    cubit = HomeCubit(mockUseCase);
  });

  tearDown(() => cubit.close());

  final testPopulars = [
    const Popular(
      id: 1,
      name: 'Jason',
      profilePath: '/jason.jpg',
      films: [],
    ),
  ];

  blocTest<HomeCubit, HomeState>(
    'Get Populars -- Success',
    build: () {
      when(mockUseCase.call(page: 1)).thenAnswer(
            (_) async => right(testPopulars),
      );
      return cubit;
    },
    act: (cubit) => cubit.getPopulars(page: 1),
    expect: () => [
      isA<GetPopularsLoading>(),
      isA<GetPopularsLoaded>(),
    ],
    verify: (_) {
      verify(mockUseCase.call(page: 1)).called(1);
    },
  );

  blocTest<HomeCubit, HomeState>(
    'Get Populars -- Fail',
    build: () {
      when(mockUseCase.call(page: 1)).thenAnswer(
            (_) async => left(
          MyServerFailure(
            MyServerException(
              MyDioException(
                requestOptions: RequestOptions(path: ''),
                isValidationError: true,
              ),
            ),
          ),
        ),
      );
      return cubit;
    },
    act: (cubit) => cubit.getPopulars(page: 1),
    expect: () => [
      isA<GetPopularsLoading>(),
      isA<GetPopularsFailure>(),
    ],
    verify: (_) {
      verify(mockUseCase.call(page: 1)).called(1);
    },
  );
}
