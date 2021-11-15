import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/dashboard/network/quiz_api_provider.dart';
import 'package:globant_quiz/src/domain/quiz/models/quiz_questions.dart';

class DashboardController extends GetxController {
  // lets call api
  final quizApiProvider = QuizApiProvider();
  // show loader
  RxBool showLoader = false.obs;
  // observer to store list questions fetched from api
  List<QuizQuestions> _questions = [];

  List<QuizQuestions> get questions => _questions;

  @override
  void onInit() {
    super.onInit();
    // call questions api on start
    getQuizQuestions();
  }

  Future<void> getQuizQuestions() async {
    showLoader(true);
    final questionResp = await quizApiProvider.fetchQuestionsApi();
    _questions = questionResp;
    showLoader(false);
  }
}
