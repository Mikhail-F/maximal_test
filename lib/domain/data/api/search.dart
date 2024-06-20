import 'package:search_users_test/domain/entities/search/search.dart';

abstract class SearchApi {
  Future<Search> searchUsers({required String text});

  Future<int> getUserFollowers({required String followersUrl});
}
