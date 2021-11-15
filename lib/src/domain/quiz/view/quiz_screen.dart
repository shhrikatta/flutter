import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/quiz/controller/question_controller.dart';
import 'package:globant_quiz/src/domain/quiz/models/quiz_questions.dart';

import 'widgets/body.dart';

class QuizScreen extends GetView<QuestionController> {
  List<QuizQuestions> _questions = [];
  QuizScreen({List<QuizQuestions>? questions, Key? key}) : super(key: key) {
    if (questions != null) _questions = questions;
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(QuestionController(quizQuestions: _questions));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
