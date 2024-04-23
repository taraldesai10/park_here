import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:park_here/common/shared_pref.dart';
import 'package:park_here/screens/bottom_bar.dart';
import 'package:park_here/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: Lottie.asset(
            "assets/Animation - 1713172278993 (6).json",
          ),
        ),
      ),
    );
  }

  void isLogedIn() {
    bool login = SharedPref.getIsLogedIn;
    Timer(const Duration(seconds: 5), () {
      if (login == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
          ),
        );
      }
    });
  }
}
