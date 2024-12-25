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
      title: "Flutter layout demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter layout demo"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Image.network(
                  'https://images.unsplash.com/photo-1471115853179-bb1d604434e0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250),
              const TitleSection(name: "Test layout", location: "District 7"),
              const SupportSection(),
              const DescriptionSection(description: "description")
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          /*3*/
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const SizedBox(width: 4),
              const Text('41')
            ],
          ),
        ],
      ),
    );
  }
}

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyButton(
            color: Colors.blueAccent,
            icon: Icons.call,
            text: "CALL",
            onPressed: () {
              print("123");
            },
          ),
          MyButton(
            color: Colors.blueAccent,
            icon: Icons.near_me,
            text: "ROUTE",
            onPressed: () {
              print("123");
            },
          ),
          MyButton(
            color: Colors.blueAccent,
            icon: Icons.share,
            text: "SHARE",
            onPressed: () {
              print("123");
            },
          ),
        ],
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.description
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(description)
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.color
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  // BoxDecoration boxDecoration = const BoxDecoration(
  //   boxShadow: [
  //     BoxShadow(color: Colors.blue, blurRadius: 0.7)
  //   ]
  // );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(decoration: BoxDecoration(),
        child: Column(
          children: [
            Icon(icon, color: color),
            Text(text, style: TextStyle(
                color: color
            ),),
          ],
        ),
      ),

    );
  }
}