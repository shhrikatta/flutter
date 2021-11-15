import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/profile/controller/profile_controller.dart';

class Profile extends GetView {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _profileController = Get.put(ProfileController());
    // TODO: implement build
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('My Profile'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      foregroundImage:
                          NetworkImage(_profileController.profileImg.value),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => Text(
                      _profileController.profileName.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Full Stack Developer'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 3,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: _profileController.showLoader.value,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
