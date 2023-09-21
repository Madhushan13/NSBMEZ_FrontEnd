import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:qr_scanner/qr_scanner.dart';

import 'Home_widget.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'qr_results_screen.dart';

const bgColor = Color.fromARGB(255, 255, 255, 255);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

bool isScanComplete = false;

void closeScreen() {
  isScanComplete = true;
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          },
        ),
        backgroundColor: Colors.white,
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
                  accountName: Text('John Doe'),
                  accountEmail: Text('johndoe@example.com'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                    // Add your logout navigation logic here
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please scan the QR code in the area",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Scanning will start automatically",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: MobileScanner(
                  onDetect: (capture) {
                    if (!isScanComplete) {
                      closeScreen();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultsScreen(
                            closeScreen: closeScreen,
                            code: null,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Scanning...",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
