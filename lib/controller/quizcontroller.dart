import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/quizoption.dart';
import 'package:quizapp/models/quizquestion.dart';
import 'package:http/http.dart' as http;
import 'package:quizapp/routes.dart';
import 'dart:convert';
import 'package:quizapp/view/resultscreen.dart';

class QuizController extends GetxController {
  var questions = <QuizQuestion>[].obs;
  var currentQuestionIndex = 0.obs;
  var score = 0.obs;
  var isLoading = true.obs;
  var error = ''.obs;
  QuizOption? selectedOption;

  @override
  void onInit() {
    super.onInit();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.jsonserve.com/Uw5CrX'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> questionsData = jsonData['questions'] as List;

        questions.value = questionsData
            .map((question) => QuizQuestion.fromJson(question))
            .toList();
      } else {
        error.value = 'Failed to load questions';
      }
    } catch (e) {
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void handleAnswer(QuizOption selectedOption, BuildContext context) {
    this.selectedOption = selectedOption;

    final isCorrect = selectedOption.isCorrect;

    Get.dialog(
      AlertDialog(
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        title: Row(
          children: [
            Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              isCorrect ? 'Correct!' : 'Incorrect',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isCorrect
                    ? 'Good job! Keep going! 🎉'
                    : 'Oops! That wasn\'t right. 😞',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Solution: ${questions[currentQuestionIndex.value].detailedSolution}',
                style: const TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              moveToNextQuestion(context);
            },
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void moveToNextQuestion(BuildContext context) {
    if (selectedOption?.isCorrect ?? false) {
      score.value += 10;
    }

    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedOption = null;
    } else {
      print("object");
      Get.offAllNamed(
        AppRoutes.resultScreen,
        arguments: {
          'score': score.value,
          'totalQuestions': questions.length,
        },
      );
    }
  }
}
