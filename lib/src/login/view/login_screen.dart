import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globant_quiz/src/helpers/constants.dart';
import 'package:globant_quiz/src/login/contoller/login_controller.dart';

/*
class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2), //2/6
                    Text(
                      "Let's Play Quiz,",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Text("Enter your informations below"),
                    const Spacer(), // 1/6
                    buildEmailField(controller),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPasswordField(controller),
                    const Spacer(), // 1/6
                    buildLoginButtonField(context, controller),
                    const Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.showLoader.value,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildEmailField(LoginController controller) {
    return Obx(
      () => TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        onChanged: controller.onEmailEntered,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1C2341),
          hintText: "Email Id",
          errorText: controller.onEmailError,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  buildPasswordField(LoginController controller) {
    return Obx(
      () => TextFormField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        onChanged: controller.onPasswordEntered,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1C2341),
          hintText: "Password",
          errorText: controller.onPasswordError,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }

  buildLoginButtonField(BuildContext context, LoginController controller) {
    return InkWell(
      // onTap: () => Get.to(QuizScreen()),
      onTap: () {
        print("clickeeeeeed");
        controller.submitValid;
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
          "Login".toUpperCase(),
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2), //2/6
                    Text(
                      "Let's Play Quiz,",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Text("Enter your informations below"),
                    const Spacer(), // 1/6
                    buildEmailField(controller),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPasswordField(controller),
                    const Spacer(), // 1/6
                    buildLoginButtonField(context, controller),
                    const Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.showLoader.value,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildEmailField(LoginController controller) {
    return Obx(
      () => TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        onChanged: controller.onEmailEntered,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1C2341),
          hintText: "Email Id",
          errorText: controller.onEmailError,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  buildPasswordField(LoginController controller) {
    return Obx(
      () => TextFormField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        onChanged: controller.onPasswordEntered,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1C2341),
          hintText: "Password",
          errorText: controller.onPasswordError,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }

  buildLoginButtonField(BuildContext context, LoginController controller) {
    return InkWell(
      // onTap: () => Get.to(QuizScreen()),
      onTap: () {
        controller.submitValid;
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
          "Login".toUpperCase(),
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
