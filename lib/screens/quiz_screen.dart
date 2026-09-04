import 'package:flutter/material.dart';

import '../data/questions/bangla_questions.dart';
import '../data/questions/english_questions.dart';
import '../data/questions/math_questions.dart';
import '../data/questions/science_questions.dart';
import '../data/questions/gk_questions.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Map<String, dynamic>> quizQuestions;

  int currentQuestion = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();

    if (widget.category == "বাংলা") {
      quizQuestions = banglaQuestions;
    } else if (widget.category == "English") {
      quizQuestions = englishQuestions;
    } else if (widget.category == "Math") {
      quizQuestions = mathQuestions;
    } else if (widget.category == "Science") {
      quizQuestions = scienceQuestions;
    } else if (widget.category == "General Knowledge") {
      quizQuestions = gkQuestions;
    } else {
      quizQuestions = [
        ...banglaQuestions,
        ...englishQuestions,
        ...mathQuestions,
        ...scienceQuestions,
        ...gkQuestions,
      ];
    }
  }

  void checkAnswer(String selectedAnswer) {
    final current = quizQuestions[currentQuestion];

    if (selectedAnswer == current["answer"]) {
      score++;
    }

    if (currentQuestion < quizQuestions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quiz Complete!"),
          content: Text(
            "Your Score: $score / ${quizQuestions.length}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (quizQuestions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("No questions available."),
        ),
      );
    }

    final current = quizQuestions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${currentQuestion + 1} / ${quizQuestions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              current["question"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ...(current["options"] as List<dynamic>).map(
              (option) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(option.toString());
                    },
                    child: Text(
                      option.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
