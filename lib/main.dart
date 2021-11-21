import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Views/home_screen.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Health',
      theme: ThemeData(
        accentColor: kColorPrimary,
        primaryColor: kColorPrimary,
        primarySwatch: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          color: kColorPrimary,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
