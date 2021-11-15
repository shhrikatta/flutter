import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:globant_quiz/src/domain/dashboard/controller/dashboard_controller.dart';
import 'package:globant_quiz/src/domain/login/view/login_screen.dart';
import 'package:globant_quiz/src/domain/profile/view/profile.dart';
import 'package:globant_quiz/src/domain/quiz/view/quiz_screen.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class QuizDashboard extends GetView {
  const QuizDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dshbrdController = Get.put(DashboardController());

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              FlatButton(
                onPressed: () {
                  Get.to(const Profile());
                },
                child: const Icon(Icons.account_circle),
              ),
              FlatButton(
                onPressed: () {
                  final box = GetStorage();
                  box.erase();
                  Get.offAll(const LoginScreen());
                },
                child: const Text("Logout"),
              ),
            ],
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Let's Play",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: const Color(0xFFed6f9e),
                                    fontWeight: FontWeight.bold),
                          ),
                          const Text("Be the first!"),
                          const SizedBox(
                            height: 40,
                          ), // 1/6
                          Container(
                            margin: const EdgeInsets.only(top: kDefaultPadding),
                            padding: const EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFed6f9e)),
                              borderRadius: BorderRadius.circular(15),
                              gradient: kSecondaryGradient,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                    Icons.arrow_drop_down_circle_outlined),
                                const SizedBox(
                                  height: 20,
                                ), // 1/6
                                const Text('Level 1'),
                                const SizedBox(
                                  height: 20,
                                ), // 1/6
                                Text(
                                  "Globant Tech",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ), // 1/6
                          buildLoginButtonField(context, _dshbrdController),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _dshbrdController.showLoader.value,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  buildLoginButtonField(
      BuildContext context, DashboardController dshbrdController) {
    return InkWell(
      onTap: () {
        if (dshbrdController.questions.isNotEmpty) {
          Get.to(QuizScreen(questions: dshbrdController.questions));
        } else {
          null;
        }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: const BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(
          "start quiz".toUpperCase(),
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
