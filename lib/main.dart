import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:globant_quiz/src/domain/login/view/login_screen.dart';
import 'package:globant_quiz/src/domain/quiz/view/quiz_screen.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () {
            final _storage = GetStorage();
            final _alreadyLoggedIn = _storage.hasData(kLoginStorage);
            return _alreadyLoggedIn ? const QuizScreen() : const LoginScreen();
          },
        ),
      ],
    );
  }
}
