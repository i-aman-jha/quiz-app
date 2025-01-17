// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/routes.dart';
import 'package:quizapp/view/quizscreen.dart';
import 'view/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      initialRoute: AppRoutes.welcomeScreen,
      getPages: AppRoutes.routes,
    );
  }
}

// Result Screen
