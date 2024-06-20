import 'package:flutter/material.dart';
import 'package:search_users_test/domain/entities/user/user.dart';
import 'package:search_users_test/pesentation/common/custom_styles/custom_styles.dart';
import 'package:search_users_test/pesentation/common/resources/resources.dart';
import 'package:search_users_test/pesentation/common/theme/colors.dart';

class UserRepositoryItem extends StatelessWidget {
  final RepositoryItem repo;
  const UserRepositoryItem({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Последний коммит: ${dateFormat(repo.updatedAt)}",
                    style:
                        CustomStyles.normalRegular(color: CustomColors.mainGrey)
                            .copyWith(fontSize: 12)),
                const SizedBox(height: 10),
                Text(
                  repo.name,
                  style: CustomStyles.normalBold().copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(repo.description, style: CustomStyles.normalRegular()),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ветка: ${repo.defaultBranch}",
                    style: CustomStyles.normalRegular()),
                Text("Форков: ${repo.forks}",
                    style: CustomStyles.normalRegular()),
                Text("Звезд: ${repo.stargazersCount}",
                    style: CustomStyles.normalRegular()),
                if (repo.language.isNotEmpty)
                  Text("Язык: ${repo.language}",
                      style: CustomStyles.normalRegular()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
