import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_users_test/core/di/get_it.dart';
import 'package:search_users_test/pesentation/common/custom_styles/custom_styles.dart';
import 'package:search_users_test/pesentation/screens/detail/cubit.dart';
import 'package:search_users_test/pesentation/screens/detail/widgets/user_repository_list.dart';

class UserRepositoryScreen extends StatelessWidget {
  final String detailUrl;
  const UserRepositoryScreen({super.key, required this.detailUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDetailCubit>(
      create: (context) {
        return getIt.call(param1: detailUrl);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Репозиторий",
            style: CustomStyles.title(),
          ),
        ),
        body: const SafeArea(
          child: UserRepositoryList(),
        ),
      ),
    );
  }
}
