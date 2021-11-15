import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:globant_quiz/src/login/view/login_screen.dart';

import 'src/login/contoller/login_controller.dart';

void main() async {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends GetView<LoginController> {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoginScreen(),
/*
      getPages: [
        GetPage(
          name: '/',
          page: () {
            return controller.loggedInStorage
                ? QuizScreen()
                : const LoginScreen();
          },
        ),
      ],
*/
    );
  }
}
