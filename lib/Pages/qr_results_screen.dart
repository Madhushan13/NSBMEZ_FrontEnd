import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'login_page.dart';
//import 'package:qr_scanner/qr_scanner.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required void Function() closeScreen, required code});

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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            QrImageView(data: '', size: 200),
            const SizedBox(height: 16),
            const Center(
                child: Text("Scanned Results",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 1,
                    ))),
            const SizedBox(height: 16),
            const Text("RESLUT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 1,
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width - 100, height: 16),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 182, 26),
                ),
                onPressed: () {},
                child: const Text("Copy",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 1,
                    )))
          ]),
        ),
      ),
    );
  }
}
