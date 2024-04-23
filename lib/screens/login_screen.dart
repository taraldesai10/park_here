import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_here/database/authentication.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  static String? email;
  static String? passWord;

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 40,
                  ),
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(120),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Log In",
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextFormField(
                        controller: txtEmailController,
                        validator: MultiValidator(
                          [
                            EmailValidator(
                              errorText: "enter valid email",
                            ),
                            RequiredValidator(
                              errorText: "enter email",
                            )
                          ],
                        ).call,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.mail,
                            color: Colors.black,
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: txtPassController,
                        validator: MultiValidator(
                          [
                            RequiredValidator(
                              errorText: "enter password",
                            )
                          ],
                        ).call,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.lock,
                            color: Colors.black,
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      LogInScreen.email = txtEmailController.text;
                      LogInScreen.passWord = txtPassController.text;
                      setState(() {
                        Authentication.signIn(context);
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(120),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    txtEmailController.dispose();
    txtPassController.dispose();
    super.dispose();
  }
}
