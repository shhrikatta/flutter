import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/quiz/models/quiz_questions.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class QuizApiProvider extends GetConnect {
  Future<List<QuizQuestions>> fetchQuestionsApi() async {
    final resp = await get('$BASE_URL/quiz');

    if (resp.statusCode == 200) {
      List _respBody = resp.body as List;
      List<QuizQuestions> _questions =
          _respBody.map((e) => QuizQuestions.fromJson(e)).toList();

      return _questions;
    } else {
      return [];
    }
  }
}
