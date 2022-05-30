import 'package:dio/dio.dart';

class Http {
  static Http? _single;

  static Http getInstance() {
    return _single ??= Http._();
  }

  static late Dio _dio;

  Dio get dio => _dio;

  static const baseUrl = 'https://yrtql.imyan.ren/api';

  Http._() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _dio = Dio(options);
  }
}
