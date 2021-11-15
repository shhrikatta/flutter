import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:globant_quiz/src/domain/login/view/login_screen.dart';
import 'package:globant_quiz/src/domain/profile/view/profile.dart';
import 'package:globant_quiz/src/domain/quiz/controller/question_controller.dart';

import 'widgets/body.dart';

class QuizScreen extends GetView<QuestionController> {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        leading: FlatButton(
          onPressed: () {
            Get.to(const Profile());
          },
          child: const Icon(Icons.account_circle),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              final box = GetStorage();
              box.erase();
              Get.offAll(const LoginScreen());
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
