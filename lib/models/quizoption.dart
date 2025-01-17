class QuizOption {
  final int id;
  final String description;
  final bool isCorrect;

  QuizOption({
    required this.id,
    required this.description,
    required this.isCorrect,
  });

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      id: json['id'],
      description: json['description'],
      isCorrect: json['is_correct'],
    );
  }
}