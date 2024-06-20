import 'package:dio/dio.dart';
import 'package:search_users_test/core/di/get_it.dart';
import 'package:search_users_test/domain/data/api/user_detail.dart';
import 'package:search_users_test/domain/entities/user/user.dart';

class UserDetailApiImpl implements UserDetailApi {
  final Dio _client = getIt();

  @override
  Future<List<RepositoryItem>> getUserDetail({required String url}) async {
    final result = await _client.get(url);
    return List.from(result.data)
        .map((el) => RepositoryItem.fromJson(el))
        .toList();
  }
}
