import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Home_widget.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class Display_Payment extends StatefulWidget {
  Display_Payment({super.key});

  @override
  State<Display_Payment> createState() => _Display_PaymentState();
}

class _Display_PaymentState extends State<Display_Payment> {
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
                width: 140,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            color: const Color(0xFFBAD3C8),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Student Username'),
                  accountEmail: Text('Student@nsbm.ac.lk'),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  decoration: BoxDecoration(color: Color(0xFF264F44)),
                ),
                ListTile(
                  leading: const Icon(Icons.account_box),
                  title: const Text('My Profile'),
                  onTap: () {
                    // Add your profile navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  onTap: () {
                    // Add your transport service navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text('Student Support'),
                  onTap: () {
                    // Add your attendance/QR navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Add your events navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text('About us'),
                  onTap: () {
                    // Add your time table navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.library_books),
                  title: const Text('Terms and Conditions '),
                  onTap: () {
                    // Add your result navigation logic here
                  },
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
                      (route) =>
                          false, // This prevents going back to the previous page.
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('payment')
                          .snapshots(),
                      builder: (context, snapshot) {
                        List<Row> ClientWidgets = [];
                        if (snapshot.hasData) {
                          final payment = snapshot.data?.docs.reversed.toList();
                          for (var payment in payment!) {
                            final ClientWidget = Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(payment['amount']),
                                Text(payment['degree']),
                                Text(payment['fee']),
                                Text(payment['id']),
                                Text(payment['intake']),
                                Text(payment['name']),
                                Text(payment['payment']),
                              ],
                            );
                            ClientWidgets.add(ClientWidget);
                          }
                        }
                        return Expanded(
                            child: ListView(
                          children: ClientWidgets,
                        ));
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(
                            0xFF264F44), // Set the background color here
                      ),
                      child: const Text('OK'),
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
