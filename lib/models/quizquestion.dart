import 'package:quizapp/models/quizoption.dart';

class QuizQuestion {
  final String question;
  final List<QuizOption> options;
  final String detailedSolution;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.detailedSolution,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['description'],
      options: (json['options'] as List)
          .map((option) => QuizOption.fromJson(option))
          .toList(),
      detailedSolution: json['detailed_solution'] ?? '',
    );
  }
}