import 'package:dio/dio.dart';

class HTTP {
  final Dio _dio;

  HTTP({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'http://localhost:3005/',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: {'Content-Type': 'application/json'},
            ),
          ) {
    _setupInterceptors();
  }

  Future<Response<dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path);
  }

  Future<Response<dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.post(path);
  }

  Future<Response<dynamic>> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.patch(path);
  }

  Future<Response<dynamic>> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.delete(path);
  }

  void _setupInterceptors() {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
