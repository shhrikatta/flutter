import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/quiz/controller/question_controller.dart';
import 'package:globant_quiz/src/domain/quiz/models/quiz_questions.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final QuizQuestions question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question ?? '',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.choices?.length ?? 0,
            (index) => Option(
              index: index,
              text: question.choices?[index] ?? '',
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
