import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_assignment_axis/core/networking/interceptors/headers_interceptor.dart';
import 'package:movie_assignment_axis/core/networking/interceptors/response_validation_interceptor.dart';
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

  // sl.registerFactory(() => OtpListenerService());
  // sl.registerLazySingleton(() => UrlLauncherService());
}
