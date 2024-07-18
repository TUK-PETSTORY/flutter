import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/intro.dart';
import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme 추가
      // route 추가
      routes: {
        // 예시
        '/': (context) => Intro(),
        '/home': (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}
