import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/lesson3/theme/theme.dart';

class CustomScafford extends StatelessWidget {
  const CustomScafford({
    super.key,
    this.child,
    this.title
  });

  final Widget? child;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
              child: child!
          )
        ],
      ),
    );
  }
}