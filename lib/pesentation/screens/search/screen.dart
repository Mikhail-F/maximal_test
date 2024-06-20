import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_users_test/pesentation/common/custom_styles/custom_styles.dart';
import 'package:search_users_test/pesentation/common/theme/colors.dart';
import 'package:search_users_test/pesentation/screens/search/cubit.dart';
import 'package:search_users_test/pesentation/screens/search/widgets/users_list.dart';
import 'package:search_users_test/pesentation/widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Поиск",
          style: CustomStyles.title(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: CustomColors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
              child: CustomTextField(
                controller: _searchController,
                hint: "Имя пользователя",
                onChange: (String text) =>
                    context.read<SearchCubit>().searchUsers(text: text),
              ),
            ),
            UsersList(controller: _searchController),
          ],
        ),
      ),
    );
  }
}
