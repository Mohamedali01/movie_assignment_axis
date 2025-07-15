import 'package:dio/dio.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';


class ResponseValidationInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      handler.next(response);

    }
    else {
      Map<String, dynamic> errors = response.data['errors'] ?? {};
      handler.reject(MyDioException(
        requestOptions: response.requestOptions,
        error: response.statusCode == 420 ? errors : null,
        message: response.statusCode == 500
              ? 'server error'
              : (response.statusCode == 420
                  ? ''
                  : response.data['errors']['message']),
        isValidationError: response.statusCode == 420,
      ));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

    Response response =
        err.response ?? Response(requestOptions: err.requestOptions);
    Map<String, dynamic> errors = response.data?['errors'] ?? {};

    super.onError(
        MyDioException(
          requestOptions: response.requestOptions,
          error: response.statusCode == 420 ? errors : null,
          message: response.statusCode == 500
              ? 'server error'
              : (response.statusCode == 420
                  ? ''
                  : response.data['errors']?['message'] ?? ''),
          isValidationError: response.statusCode == 420,
          statusCode: response.statusCode,
        ),
        handler);
  }
}
