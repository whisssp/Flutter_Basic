
import 'package:flutter/material.dart';
import 'package:tutorial/lesson2/sign_in.dart';
import 'package:tutorial/lesson2/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lesson 2",
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), child: Text("Sign In")),
                Tab(icon: Icon(Icons.directions_transit), child: Text("Sign Up"),),
              ],
            ),
          ),
            body: TabBarView(
              children: [
                SignIn(),
                SignUp(),
              ],
            ),
        ),
      )
    );
  }
}