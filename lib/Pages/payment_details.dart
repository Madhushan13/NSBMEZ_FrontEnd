import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/Pages/display_paymenst.dart';
import 'package:flutter_application/Pages/sendmail.dart';
import 'Home_widget.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class Online_Payment extends StatefulWidget {
  Online_Payment({super.key});

  @override
  State<Online_Payment> createState() => _Online_PaymentState();
}

class _Online_PaymentState extends State<Online_Payment> {
  final idController = TextEditingController();

  final nameController = TextEditingController();

  final intakeController = TextEditingController();

  final degreeController = TextEditingController();

  final feeController = TextEditingController();

  final amountController = TextEditingController();

  final paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 80,
          actions: [
            Builder(
              builder: (context) => IconButton(
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            ),
          ],
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/NSBMEZ Black.png',
                height: 100,
                width: 150,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.white, // Change the background color as needed
            child: Column(
              children: [
                Image.asset(
                  'assets/images/NSBMEZ Black.png',
                  height: 100,
                  width: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text('Student Support'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendMail(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to the settings page
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Student ID',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Student Name',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: intakeController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Intake',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: degreeController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Degree',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: feeController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Fee',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: amountController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Amount',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: paymentController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Payment Method',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        CollectionReference collRef =
                            FirebaseFirestore.instance.collection('payment');

                        collRef.add({
                          'id': idController.text,
                          'name': nameController.text,
                          'intake': intakeController.text,
                          'degree': degreeController.text,
                          'fee': feeController.text,
                          'amount': amountController.text,
                          'payment': paymentController.text,
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Display_Payment(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(
                            0xFF264F44), // Set the background color here
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3, // Set the correct index for EventsPage
          onTap: (index) {
            // Handle bottom navigation bar tap event
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDialog()),
              );
            }
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
        ),
      ),
    );
  }
}

class TextFieldItem extends StatelessWidget {
  final String label;

  const TextFieldItem({Key? key, required this.label}) : super(key: key);

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
