import 'package:exam_1/utils/my_page_route.dart';
import 'package:exam_1/views/screens/detail_page.dart';
import 'package:exam_1/views/screens/home_page.dart';
import 'package:exam_1/views/screens/splesh_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        MyPageRoute.home: (context) => HomePage(),
        MyPageRoute.splesh: (context) => const splesh(),
        MyPageRoute.detailPage: (context) => DetailPage(),
      },
    );
  }
}
