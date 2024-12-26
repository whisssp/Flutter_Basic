
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorial/lesson2/component/my_button.dart';
import 'package:tutorial/lesson2/component/square_tile.dart';

import 'component/my_textfield.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() {
    print("asd");
  }

  @override
  Widget build(BuildContext context) {
    final String signInText = 'Sign In'.toUpperCase();
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                signInText,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
              ),
            ),

            const SizedBox(height: 32),

            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false
            ),

            const SizedBox(height: 32),

            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true
            ),

            const SizedBox(height: 32),

            MyButton(onTap: signIn),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 2)
                  ),
                  SizedBox(width: 10),
                  Text("Or continue with"),
                  SizedBox(width: 10),
                  Expanded(
                      child: Divider(thickness: 2)
                  )
                ],
              ),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imageUrl: 'assets/images/google.png', width: 75.0),
                SizedBox(width: 45),
                SquareTile(imageUrl: 'assets/images/apple.png'),
              ],
            )
          ],
        )
      ),
    );
  }
}