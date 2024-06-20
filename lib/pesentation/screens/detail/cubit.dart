import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_users_test/core/di/get_it.dart';
import 'package:search_users_test/domain/entities/common/result.dart';
import 'package:search_users_test/domain/entities/user/user.dart';
import 'package:search_users_test/domain/usecases/search/user_detail.dart';
import 'package:search_users_test/pesentation/screens/detail/state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final UserDetailUseCase _userDetailUseCase = getIt();
  UserDetailCubit({required String urlDetail})
      : super(const UserDetailState()) {
    getUserDetail(url: urlDetail);
  }

  Future<void> getUserDetail({required String url}) async {
    emit(state.copyWith(isLoading: true, isError: false));
    final String detailUrl = url.substring(23);
    final Result<List<RepositoryItem>> result =
        await _userDetailUseCase.getUserDetail(text: detailUrl);
    if (result.isSuccess) {
      emit(state.copyWith(resitories: result.value));
    } else {
      emit(state.copyWith(isError: true));
    }
    emit(state.copyWith(isLoading: false));
  }
}
