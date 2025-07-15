import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_assignment_axis/core/networking/interceptors/headers_interceptor.dart';
import 'package:movie_assignment_axis/core/networking/interceptors/response_validation_interceptor.dart';
import 'package:movie_assignment_axis/features/home/data/datasource/home_data_source.dart';
import 'package:movie_assignment_axis/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_assignment_axis/features/home/domain/repo/home_repo.dart';
import 'package:movie_assignment_axis/features/home/domain/usecase/get_populars_use_case.dart';
import 'package:movie_assignment_axis/features/home/presentation/cubit/home_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

setUp() async {
  await dotenv.load();

  sl.registerLazySingleton(
    () => Dio()
      ..interceptors.addAll([
        HeadersInterceptor(),
        ResponseValidationInterceptor(),
        PrettyDioLogger(
          responseBody: kDebugMode,
        )
      ]),
  );

  sl.registerFactory<HomeDataSource>(() => HomeDataSourceImpl(sl()));
  sl.registerFactory<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerFactory(() => GetPopularsUseCase(sl()));
  sl.registerLazySingleton(() => HomeCubit(sl()));

  // sl.registerFactory(() => OtpListenerService());
  // sl.registerLazySingleton(() => UrlLauncherService());
}
