import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Profile extends GetView {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AOh14GhQg5BjvEeKF__aq6ORMmy0seIrv3MXEG2AgT-by5M=s96-c-rg-br100'),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Shri Charan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Pacifico',
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
    );
  }
}
