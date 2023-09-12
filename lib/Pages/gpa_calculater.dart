import 'package:flutter/material.dart';

class GPACalculatorPage extends StatefulWidget {
  const GPACalculatorPage({super.key});

  @override
  _GPACalculatorPageState createState() => _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  List<double?> grades = List.generate(10, (_) => 4.0); // Default to 'A'
  List<double?> credits = List.generate(10, (_) => 3.0); // Default to 3 credits

  double calculateGPA() {
    double totalGradePoints = 0;
    double totalCredits = 0;

    for (int i = 0; i < 10; i++) {
      totalGradePoints += (grades[i] ?? 0) * (credits[i] ?? 0);
      totalCredits += credits[i] ?? 0;
    }

    return totalCredits == 0 ? 0 : totalGradePoints / totalCredits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter Grades and Credits for 10 Subjects',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < 10; i++)
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: DropdownButton<double?>(
                        value: grades[i],
                        onChanged: (value) {
                          setState(() {
                            grades[i] = value;
                          });
                        },
                        items: const [
                          DropdownMenuItem(value: 4.0, child: Text('A')),
                          DropdownMenuItem(value: 3.7, child: Text('A-')),
                          DropdownMenuItem(value: 3.3, child: Text('B+')),
                          DropdownMenuItem(value: 3.0, child: Text('B')),
                          DropdownMenuItem(value: 2.7, child: Text('B-')),
                          DropdownMenuItem(value: 2.3, child: Text('C+')),
                          DropdownMenuItem(value: 2.0, child: Text('C')),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Credits'),
                        onChanged: (value) {
                          setState(() {
                            credits[i] = double.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  double gpa = calculateGPA();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('GPA Calculation'),
                      content: Text('Your GPA is: ${gpa.toStringAsFixed(2)}'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Calculate GPA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: GPACalculatorPage()));
}
