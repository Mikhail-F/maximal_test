import 'package:search_users_test/domain/entities/user/user.dart';

abstract class UserDetailApi {
  Future<List<RepositoryItem>> getUserDetail({required String url});
}
