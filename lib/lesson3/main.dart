import 'package:flutter/material.dart';
import 'package:tutorial/lesson3/widgets/custom_scafford.dart';
import 'package:tutorial/lesson3/screens/welcome_screen.dart';

void main() {
  runApp(const MyAppL3());
}

class MyAppL3 extends StatelessWidget {
  const MyAppL3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lesson 3",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white30
        )
      ),
      home: WelcomeScreen(),
    );
  }
}