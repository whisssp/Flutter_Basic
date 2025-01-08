import 'package:flutter/material.dart';
import 'package:tutorial/lesson3/widgets/custom_scafford.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CustomScafford(
      child: Text("Sign Up"),
    );
  }
}