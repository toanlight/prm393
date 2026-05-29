import 'package:flutter/material.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({super.key});

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),

      darkTheme: ThemeData(brightness: Brightness.dark),

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4 – App Structure & Theme"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          actions: [
            const Center(child: Text("Dark")),

            Switch(
              value: isDarkMode,

              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),

        body: const Center(
          child: Text("This is a simple screen with theme toggle."),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},

          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
