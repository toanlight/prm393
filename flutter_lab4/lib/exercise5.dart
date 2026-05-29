import 'package:flutter/material.dart';

class CommonUI extends StatefulWidget {
  const CommonUI({super.key});

  @override
  State<CommonUI> createState() => _CommonUIState();
}

class _CommonUIState extends State<CommonUI> {
  List<String> movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI...'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.movie, color: Colors.blueGrey),
                  title: Text(movies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
