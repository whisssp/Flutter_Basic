import 'package:flutter/material.dart';
import 'package:tutorial/lesson3/helper/fn.dart';
import 'package:tutorial/lesson3/screens/signin_screen.dart';
import 'package:tutorial/lesson3/screens/signup_screen.dart';
import 'package:tutorial/lesson3/theme/theme.dart';
import 'package:tutorial/lesson3/widgets/custom_scafford.dart';
import 'package:tutorial/lesson3/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScafford(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 32
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome Back!\n',
                        style: TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      TextSpan(
                        text: 'Enter personal details to your employee account',
                        style: TextStyle(
                          fontSize: 20
                        )
                      )
                    ]
                  )
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: "Sign In",
                      bgBolor: Colors.transparent,
                      onTap: () => navigateTo(context, const SignInScreen())
                    )
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: "Sign Up",
                      bgBolor: lightColorScheme.background,
                      textColor: lightColorScheme.primary,
                      onTap: () => navigateTo(context, const SignUpScreen())
                    )
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}