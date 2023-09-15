import 'package:flutter/material.dart';

import 'Home_widget.dart';
import 'home_page.dart';

// ignore: camel_case_types
class Online_Payment extends StatelessWidget {
  const Online_Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Payment'),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF1B6E4F),
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const TextFieldItem(label: 'Student’s NSBM ID No'),
                  const TextFieldItem(label: 'Student’s Name'),
                  const TextFieldItem(label: 'Student’s Intake'),
                  const TextFieldItem(label: 'Degree Program'),
                  const TextFieldItem(label: 'Fee Type'),
                  const TextFieldItem(label: 'Order No'),
                  const TextFieldItem(label: 'Amount'),
                  const TextFieldItem(label: 'Currency'),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, // Set the correct index for EventsPage
        onTap: (index) {
          // Handle bottom navigation bar tap event
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
      ),
    );
  }
}

class TextFieldItem extends StatelessWidget {
  final String label;

  const TextFieldItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter $label',
            ),
          ),
        ],
      ),
    );
  }
}
