import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_users_test/core/app.dart';
import 'package:search_users_test/core/di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // Цвет статус бара и вермени на андроиде
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  // // Отображение статус бара
  if (Platform.isIOS) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }
  // Установка вертикальной ориентации
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await registerGetIt();
  runApp(const SearchUsersApp());
}
