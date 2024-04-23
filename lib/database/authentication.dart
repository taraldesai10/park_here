import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:park_here/common/shared_pref.dart';
import 'package:park_here/common/snackbar.dart';
import 'package:park_here/screens/bottom_bar.dart';

import 'package:park_here/screens/login_screen.dart';

class Authentication {
  static signIn(context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: LogInScreen.email.toString(),
        password: LogInScreen.passWord.toString(),
      )
          .then(
        (value) {
          SharedPref.setLogIN = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
          );
        },
      );
      // .onError(
      //   (error, stackTrace) {
      //     showSnackbarMessage(
      //       context,
      //       "invalid email & pass",
      //     );
      //   },
      // );
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
      showSnackbarMessage(context, e.code.toString(), Colors.red);
    }
  }
}
