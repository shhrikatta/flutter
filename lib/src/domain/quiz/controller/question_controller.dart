import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:globant_quiz/src/domain/quiz/models/quiz_questions.dart';
import 'package:globant_quiz/src/domain/quiz/view/score_screen.dart';

// We use get package for our state management
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  List<QuizQuestions> _questions = [];

  QuestionController({List<QuizQuestions>? quizQuestions, int? correctAns}) {
    if (quizQuestions != null && quizQuestions.isNotEmpty) {
      _questions = quizQuestions;
    }

    if (correctAns != null) _numOfCorrectAns = correctAns;
  }

  // Lets animated our progress bar
  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  List<QuizQuestions> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  // for more about obs please check documentation
  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // so our plan is to fill the progress bar within 15s
    _animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);

    // Our animation duration is 15 s
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });
    // start our animation
    // Once 15s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(QuizQuestions question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = 1;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 2s it will go to the next qn
    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to navigate another page
      Get.off(ScoreScreen(
        questions: questions,
        correctAnswers: numOfCorrectAns,
      ));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
