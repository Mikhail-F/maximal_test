import 'package:search_users_test/core/di/get_it.dart';
import 'package:search_users_test/domain/data/api/user_detail.dart';
import 'package:search_users_test/domain/entities/common/result.dart';
import 'package:search_users_test/domain/entities/user/user.dart';

abstract class UserDetailUseCase {
  Future<Result<List<RepositoryItem>>> getUserDetail({required String text});
}

class UserDetailUseCaseImpl implements UserDetailUseCase {
  final UserDetailApi _userDetailApi = getIt();

  @override
  Future<Result<List<RepositoryItem>>> getUserDetail(
      {required String text}) async {
    try {
      final List<RepositoryItem> result =
          await _userDetailApi.getUserDetail(url: text);
      return Result.success(result);
    } catch (e) {
      return Result.failure("Не удалось найти пользователя.");
    }
  }
}
