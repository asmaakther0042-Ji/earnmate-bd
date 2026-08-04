import 'package:flutter/material.dart';
import '../data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestion]["answer"]) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Quiz Finished"),
          content: Text(
            "Your Score: $score / ${questions.length}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestion = 0;
                  score = 0;
                });
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      );
    }
  }
   @override
  Widget build(BuildContext context) {
    final current = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${currentQuestion + 1}/${questions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              current["question"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            ...(current["options"] as List<String>).map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(option),
                  child: Text(option),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
