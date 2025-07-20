import 'package:dio/dio.dart';

final http = Dio(BaseOptions(
  baseUrl: 'http://localhost:3000/api',
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {'Content-Type': 'application/json'},
))
  ..interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    ),
  );
