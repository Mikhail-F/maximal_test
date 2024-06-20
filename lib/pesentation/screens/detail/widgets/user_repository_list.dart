import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_users_test/domain/entities/user/user.dart';
import 'package:search_users_test/pesentation/screens/detail/cubit.dart';
import 'package:search_users_test/pesentation/screens/detail/state.dart';
import 'package:search_users_test/pesentation/screens/detail/widgets/user_not_found.dart';
import 'package:search_users_test/pesentation/screens/detail/widgets/user_repository_item.dart';
import 'package:search_users_test/pesentation/widgets/common/error_loading.dart';
import 'package:search_users_test/pesentation/widgets/custom_app_loader.dart';

class UserRepositoryList extends StatelessWidget {
  const UserRepositoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailCubit, UserDetailState>(
      builder: (BuildContext context, state) {
        return Align(
          alignment: Alignment.center,
          child: state.isLoading
              ? const CustomAppLoader()
              : state.isError
                  ? const ErrorLoading()
                  : state.resitories.isEmpty
                      ? const UserNotFoundArticle()
                      : ListView.separated(
                          itemCount: state.resitories.length,
                          padding: const EdgeInsets.all(16),
                          separatorBuilder: (context, index) =>
                              const Divider(height: 10),
                          itemBuilder: (context, index) {
                            final RepositoryItem repo = state.resitories[index];
                            return UserRepositoryItem(repo: repo);
                          },
                        ),
        );
      },
    );
  }
}
