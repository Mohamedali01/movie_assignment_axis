import 'package:dio/dio.dart';
import 'package:movie_assignment_axis/core/exceptions/exceptions.dart';

class Failure implements Exception {
  final dynamic message;
  final int? code;
  Map<String, dynamic>? messageArray;

  Failure({this.message, this.messageArray, this.code});

  @override
  String toString() {
    Object message = this.message;

    return "Exception: $message";
  }
}

class ServerFailure extends Failure {
  ServerFailure([String? message])
      : super(message: message ?? "server_exception", code: 500);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(
      {String? message, Map<String, dynamic>? messageArray, int? code})
      : super(
          message: message ?? "firebase_exception",
          code: code ?? 500,
        );
}

class MyServerFailure extends ServerException {
  MyServerFailure(MyServerException e, {int? myStatusCode}) : super(e.message) {
    requestOptions = e.requestOptions;
    error = e.error;
    isValdiationError = e.isValidationError;
    statusCode = myStatusCode;
  }

  RequestOptions? requestOptions;
  Object? error;
  bool? isValdiationError;
  int? statusCode;
}
