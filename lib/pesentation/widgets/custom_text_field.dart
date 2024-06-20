import 'package:flutter/material.dart';
import 'package:search_users_test/pesentation/common/custom_styles/custom_styles.dart';
import 'package:search_users_test/pesentation/common/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChange;
  final String? hint;

  const CustomTextField({
    super.key,
    required this.controller,
    this.onChange,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      style: CustomStyles.normalRegular(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColors.secondGrey,
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: CustomColors.borderGrey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.mainGrey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(color: CustomColors.mainGrey),
        hintText: hint ?? '',
      ),
    );
  }
}
