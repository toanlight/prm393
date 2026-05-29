import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  final List<String> movies = const [
    "Avatar",
    "Inception",
    "Interstellar",
    "Joker",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise 3 – Layout Demo",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // Header
            const Center(
              child: Text(
                "Now Playing",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Movie List
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: Card(
                      elevation: 2,

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                          14,
                        ),
                      ),

                      child: Padding(
                        padding:
                        const EdgeInsets.all(
                          12,
                        ),

                        child: Row(
                          children: [

                            // Circle Avatar
                            CircleAvatar(
                              backgroundColor:
                              Colors
                                  .indigo.shade100,

                              child: Text(
                                movies[index][0],
                              ),
                            ),

                            const SizedBox(
                              width: 12,
                            ),

                            // Movie Info
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [
                                Text(
                                  movies[index],
                                  style:
                                  const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                  ),
                                ),

                                const SizedBox(
                                  height: 4,
                                ),

                                const Text(
                                  "Sample description",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}