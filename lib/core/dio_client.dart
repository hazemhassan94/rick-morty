import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    return Dio(BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }
}
