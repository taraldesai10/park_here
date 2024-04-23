import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:park_here/database/firebase_options.dart';
import 'package:park_here/screens/bottom_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      //
      //
      home: const BottomBar(),
      //
      //
      //
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
