import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void startQuiz(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "name": "বাংলা",
        "icon": Icons.menu_book,
        "color": Colors.green,
      },
      {
        "name": "English",
        "icon": Icons.language,
        "color": Colors.blue,
      },
      {
        "name": "Math",
        "icon": Icons.calculate,
        "color": Colors.orange,
      },
      {
        "name": "Science",
        "icon": Icons.science,
        "color": Colors.purple,
      },
      {
        "name": "General Knowledge",
        "icon": Icons.public,
        "color": Colors.red,
      },
      {
        "name": "All Questions",
        "icon": Icons.quiz,
        "color": Colors.teal,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Category"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return Card(
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  startQuiz(
                    context,
                    category["name"] as String,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      category["icon"] as IconData,
                      size: 48,
                      color: category["color"] as Color,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      category["name"] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
