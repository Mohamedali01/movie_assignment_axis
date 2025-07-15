import 'package:dio/dio.dart';

class CustomException implements Exception {
  final String? message;

  CustomException([this.message]);
}

class GeneralException extends CustomException {
  @override
  String? get message => "something went wrong";
}

class ServerException implements CustomException {
  // ignore: prefer_final_fields
  String? _message = "server_exception";

  ServerException([this._message]);

  @override
  String? get message => _message;
}

class FirebaseCustomException implements CustomException {
  FirebaseCustomException([String? message]) {
    _message = message;
  }

  String? _message = "firebase_exception";

  @override
  String? get message => _message;
}

class MyDioException extends DioException {
  MyDioException(
      {
        required super.requestOptions,
      super.error,
      super.response,
      super.message,
      this.statusCode,
      
      required this.isValidationError,});

  bool isValidationError;
  int? statusCode;

}

class MyServerException extends ServerException {
  MyServerException(MyDioException e, {int? myStatusCode}) : super(e.message) {
    requestOptions = e.requestOptions;
    error = e.error;
    isValidationError = e.isValidationError;
    statusCode = myStatusCode;
  }

  RequestOptions? requestOptions;
  Object? error;
  bool? isValidationError;
  int? statusCode;
}
