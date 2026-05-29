import 'package:flutter/material.dart';

import 'core_widgets_demo.dart';
import 'exercise2.dart';
import 'exercise3.dart';
import 'exercise4.dart';
import 'exercise5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> exercises = const [
    "Exercise 1 – Core Widgets",
    "Exercise 2 – Input Controls",
    "Exercise 3 – Layout Demo",
    "Exercise 4 – App Structure & Theme",
    "Exercise 5 – Common UI Fixes",
  ];

  final List<String> exerciseDescriptions = const [
    "Demo",
    "Demo",
    "",
    "Theme",
    "Fixes",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lab 4 – Flutter UI Fundamentals")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),

                title: Text(
                  exercises[index],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: exerciseDescriptions[index].isNotEmpty
                    ? Text(exerciseDescriptions[index])
                    : null,
                trailing: const Icon(Icons.chevron_right),

                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoreWidgetsDemo()
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputControlsDemo()
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LayoutDemo()
                      ),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppStructure()
                      ),
                    );
                  } else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommonUI()
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
