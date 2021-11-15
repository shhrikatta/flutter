import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/dashboard/view/quiz_dashboard.dart';
import 'package:globant_quiz/src/domain/quiz/controller/question_controller.dart';
import 'package:globant_quiz/src/domain/quiz/models/quiz_questions.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class ScoreScreen extends GetView<QuestionController> {
  List<QuizQuestions> _questions = [];
  int? _correctAnswers = 0;

  ScoreScreen({List<QuizQuestions>? questions, int? correctAnswers, Key? key})
      : super(key: key) {
    if (questions != null) _questions = questions;
    _correctAnswers = correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController(
        quizQuestions: _questions, correctAns: _correctAnswers));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kSecondaryColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${_qnController.numOfCorrectAns}/${_qnController.questions.length}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: kSecondaryColor),
            ),
            const SizedBox(
              height: 40,
            ),
            buildLoginButtonField(context, _qnController),
          ],
        ),
      ),
    );
  }

  buildLoginButtonField(BuildContext context, QuestionController qnController) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: InkWell(
        onTap: () => Get.offAll(const QuizDashboard()),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
          decoration: const BoxDecoration(
            gradient: kPrimaryGradient,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            "Retake Quiz".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
