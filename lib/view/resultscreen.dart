import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/welcomescreen.dart';
import 'package:quizapp/view/widgets/mybutton.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String getResultMessage(int score, int totalQuestions) {
    final percentage = (score / (totalQuestions * 10)) * 100;
    if (percentage >= 80) {
      return 'Excellent! You\'re a Quiz Master! 🏆';
    } else if (percentage >= 60) {
      return 'Great job! Keep it up! 🌟';
    } else if (percentage >= 40) {
      return 'Good effort! Try again to improve! 💪';
    } else {
      return 'Keep practicing! You\'ll do better next time! 📚';
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final int score = arguments['score'];
    final int totalQuestions = arguments['totalQuestions'];
    final String resultMessage = getResultMessage(score, totalQuestions);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[400]!, Colors.blue[800]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events,
                size: 100,
                color: Colors.yellow,
              ),
              const SizedBox(height: 20),
              Text(
                'Quiz Complete!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Score: $score/${totalQuestions * 10}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  resultMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              MyButton(
                onPressed: () {
                  Get.offAll(() => const WelcomeScreen());
                },
                text: "Try Again",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
