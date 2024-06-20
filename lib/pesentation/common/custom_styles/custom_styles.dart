import 'package:flutter/material.dart';
import 'package:search_users_test/pesentation/common/theme/colors.dart';

class CustomStyles {
  static TextStyle normalRegular({Color color = CustomColors.mainBlack}) =>
      TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 1.2,
        fontFamily: 'Lato',
      );

  static TextStyle normalBold({Color color = CustomColors.mainBlack}) =>
      TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.2,
        fontFamily: 'Lato',
      );

  static TextStyle title({Color color = CustomColors.mainBlack}) =>
      TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 1.2,
        fontFamily: 'Lato',
      );
}
