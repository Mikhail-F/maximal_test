import 'package:dio/dio.dart';

class ApiClient {
  static const baseUrl = 'https://api.github.com/';

  Dio create() {
    final Dio client = Dio(
      BaseOptions(baseUrl: baseUrl),
    );

    return client;
  }
}
