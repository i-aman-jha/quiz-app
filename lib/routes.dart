import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/quizscreen.dart';
import 'package:quizapp/view/resultscreen.dart';
import 'package:quizapp/view/welcomescreen.dart';

class AppRoutes {
  static const String welcomeScreen = '/welcome';
  static const String quizScreen = '/quiz';
  static const String resultScreen = '/result';

  static List<GetPage> routes = [
    GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: quizScreen,
      page: () => QuizScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: resultScreen,
      page: () => ResultScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut,
    ),
  ];
}
