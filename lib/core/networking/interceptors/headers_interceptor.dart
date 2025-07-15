import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HeadersInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Accept"] = "Application/json";

    options.baseUrl = dotenv.env["BASE_URL"] ?? "";
      options.headers.addAll({
        "Authorization": "Bearer ${dotenv.env["ACCESS_TOKEN"]}",
      });

    super.onRequest(options, handler);
  }
}
