
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This l1_layout is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Main",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Main"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Main"))
      ),
    );
  }
}
