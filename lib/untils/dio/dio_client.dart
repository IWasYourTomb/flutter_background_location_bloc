import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/api_constants.dart';


@Singleton()
class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseURL,
      receiveTimeout: 10000,
      followRedirects: true,
      connectTimeout: 10000,
      sendTimeout: 10000,
    );
  }

  Dio get dio => _dio;
}