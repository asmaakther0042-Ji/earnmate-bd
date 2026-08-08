import 'questions/bangla_questions.dart';
import 'questions/english_questions.dart';
import 'questions/math_questions.dart';
import 'questions/science_questions.dart';
import 'questions/gk_questions.dart';

final List<Map<String, dynamic>> questions = [
  ...banglaQuestions,
  ...englishQuestions,
  ...mathQuestions,
  ...scienceQuestions,
  ...gkQuestions,
];
