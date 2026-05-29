import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() =>
      _InputControlsDemoState();
}

class _InputControlsDemoState
    extends State<InputControlsDemo> {

  double sliderValue = 50;

  bool isActive = false;

  String selectedGenre = "None";

  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? pickedDate =
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise 2 – Input Controls",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // Slider
            const Text(
              "Rating (Slider)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: sliderValue,
              min: 0,
              max: 100,

              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),

            Text(
              "Current value: ${sliderValue.toInt()}",
            ),

            const SizedBox(height: 24),

            // Switch
            const Text(
              "Active (Switch)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SwitchListTile(
              title: Text(
                isActive
                    ? "Is movie active?"
                    : "Inactive",
              ),

              value: isActive,

              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // RadioListTile
            const Text(
              "Genre (RadioListTile)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile(
              title: const Text("Action"),
              value: "Action",
              groupValue: selectedGenre,

              onChanged: (value) {
                setState(() {
                  selectedGenre = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Comedy"),
              value: "Comedy",
              groupValue: selectedGenre,

              onChanged: (value) {
                setState(() {
                  selectedGenre = value!;
                });
              },
            ),

            Text(
              "Selected genre: $selectedGenre",
            ),

            const SizedBox(height: 24),

            // Date Picker Button
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: pickDate,

                child: const Text(
                  "Open Date Picker",
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              selectedDate == null
                  ? "No date selected"
                  : "Selected date: "
                  "${selectedDate!.day}/"
                  "${selectedDate!.month}/"
                  "${selectedDate!.year}",
            ),
          ],
        ),
      ),
    );
  }
}