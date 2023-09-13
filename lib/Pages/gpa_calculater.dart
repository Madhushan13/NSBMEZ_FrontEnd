import 'package:flutter/material.dart';

import 'Home_widget.dart';

// Custom class to represent a subject
class Subject {
  double? grade;
  double? credit;

  Subject(
      {this.grade = 4.0,
      this.credit = 3.0}); // Set default grade to 'A' (4.0) and credit to 3.0
}

class GPACalculatorPage extends StatefulWidget {
  const GPACalculatorPage({super.key});

  @override
  _GPACalculatorPageState createState() => _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  int currentSubject = 1; // Set the default subject value to 1
  List<Subject> subjects = List.generate(
      100, (_) => Subject()); // Default to 'A' and 3.0 credits for 100 subjects

  // Create a list of TextEditingController instances to control the credit text fields
  List<TextEditingController> creditControllers =
      List.generate(100, (_) => TextEditingController(text: '3.0'));

  double calculateGPA() {
    double totalGradePoints = 0;
    double totalCredits = 0;

    for (int i = 0; i < currentSubject; i++) {
      totalGradePoints += (subjects[i].grade ?? 0) * (subjects[i].credit ?? 0);
      totalCredits += subjects[i].credit ?? 0;
    }

    return totalCredits == 0 ? 0 : totalGradePoints / totalCredits;
  }

  // Function to add a new subject
  void addSubject() {
    if (currentSubject < 100) {
      setState(() {
        currentSubject++;
      });
    }
  }

  // Function to remove a subject
  void removeSubject(int index) {
    if (currentSubject > 1) {
      setState(() {
        currentSubject--;
        subjects.removeAt(index);
        creditControllers.removeAt(index);
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the TextEditingController instances to avoid memory leaks
    for (final controller in creditControllers) {
      controller.dispose();
    }
    super.dispose();
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
                'Enter Grades and Credits in Subjects',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < currentSubject; i++)
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: DropdownButton<double?>(
                        value: subjects[i].grade,
                        onChanged: (value) {
                          setState(() {
                            subjects[i].grade = value;
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
                        controller: creditControllers[
                            i], // Use the respective controller
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Credits'),
                        onChanged: (value) {
                          setState(() {
                            subjects[i].credit = double.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        removeSubject(i);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        addSubject();
                      },
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
              const SizedBox(height: 10),
              Text(
                  'Current Subject: $currentSubject'), // Display current subject counter
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1, // Set the correct index for EventsPage
        onTap: (index) {
          // Handle bottom navigation bar tap event
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: GPACalculatorPage()));
}
