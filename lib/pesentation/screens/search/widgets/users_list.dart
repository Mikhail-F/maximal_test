import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_users_test/domain/entities/search/search_item.dart';
import 'package:search_users_test/pesentation/screens/search/cubit.dart';
import 'package:search_users_test/pesentation/screens/search/state.dart';
import 'package:search_users_test/pesentation/screens/search/widgets/user_list_item.dart';
import 'package:search_users_test/pesentation/widgets/common/error_loading.dart';
import 'package:search_users_test/pesentation/screens/search/widgets/users_not_found.dart';
import 'package:search_users_test/pesentation/widgets/custom_app_loader.dart';

class UsersList extends StatelessWidget {
  final TextEditingController controller;
  const UsersList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, state) {
        return Expanded(
          child: Align(
            alignment: Alignment.center,
            child: state.isLoading
                ? const CustomAppLoader()
                : state.isError
                    ? const ErrorLoading()
                    : state.users.isEmpty
                        ? const UsersNotFoundArticle()
                        : ListView.separated(
                            padding: const EdgeInsets.all(16),
                            itemCount: state.users.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                            itemBuilder: (context, index) {
                              final SearchItem user = state.users[index];
                              return UserListItem(user: user);
                            },
                          ),
          ),
        );
      },
    );
  }
}
