import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/questions_model.dart';

class QuizService {
  Future<List<Question>> loadQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/questions.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Question.fromJson(json)).toList();
  }
}
