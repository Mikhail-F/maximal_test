import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_users_test/core/di/get_it.dart';
import 'package:search_users_test/domain/entities/common/result.dart';
import 'package:search_users_test/domain/entities/search/search.dart';
import 'package:search_users_test/domain/usecases/search/search.dart';
import 'package:search_users_test/pesentation/screens/search/state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _feedBackUseCase = getIt();
  SearchCubit() : super(const SearchState());

  Future<void> searchUsers({required String text}) async {
    EasyDebounce.debounce(
      "searchUsers",
      const Duration(milliseconds: 500),
      () async {
        emit(state.copyWith(isLoading: true, isError: false));
        // Проверка на пустое поле ввода
        if (text.trim().isEmpty) {
          return emit(state.copyWith(isLoading: false, users: []));
        }
        final Result<Search> result =
            await _feedBackUseCase.searchUsers(text: text);
        if (result.isSuccess) {
          // Запрос за подписчиками пользователя
          _getUserFollowers(result);
          emit(state.copyWith(users: result.value.items));
        } else {
          emit(state.copyWith(isError: true));
        }
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> _getUserFollowers(Result<Search> result) async {
    await Future.wait(result.value.items.map((el) async {
      final String followersUrl = el.followersUrl!.substring(23);
      final Result<int> userFollowers =
          await _feedBackUseCase.getUserFollowers(followersUrl: followersUrl);
      if (userFollowers.isSuccess) el.followersCount = userFollowers.value;
    }).toList());
  }

  @override
  Future<void> close() {
    EasyDebounce.cancel("searchUsers");
    return super.close();
  }
}
