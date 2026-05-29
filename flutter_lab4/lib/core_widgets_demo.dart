import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise 1 – Core Widgets Demo",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // Text Widget
            const Text(
              "Welcome to Flutter UI",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            // Icon Widget
            const Center(
              child: Icon(
                Icons.movie,
                size: 70,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 24),

            // Image Widget
            ClipRRect(
              borderRadius:
              BorderRadius.circular(12),

              child: Image.network(
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // Card + ListTile
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(14),
              ),

              child: const ListTile(
                leading: Icon(Icons.star),

                title: Text("Movie Item"),

                subtitle: Text(
                  "This is a sample ListTile inside a Card.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}