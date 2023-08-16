import 'package:flutter/material.dart';
//import 'package:flutter_application/Pages/home_page.dart';
//import 'package:flutter_application/Pages/login_page.dart';

const Color kHintTextColor = Colors.grey; // Define the hint text color here

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 80,
            backgroundColor: const Color(0xFF264F44),
            actions: [
              // Notification Icon
              IconButton(
                onPressed: () {
                  // Add your notification logic here
                },
                icon: const Icon(Icons.notifications),
              ),
              Builder(
                builder: (context) => IconButton(
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
                      // Add your logout navigation logic here
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Adjust the opacity level as needed
                    Image.asset(
                      'assets/images/rectangle-17-bg-Rf7.png',
                      height: 80,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),

                    const Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Change text color if needed
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Year 1")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Year 2")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Year 3")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Year 4")),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Semester 1")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Semester 2")),
                    ),
                  ],
                ),
                //adding space
                const SizedBox(
                  height: 30,
                ),
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Module Code',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('module',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Result',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('ss'))),
                      DataCell(Center(child: Text('ss'))),
                    ]),
                    DataRow(cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('ss'))),
                      DataCell(Center(child: Text('ss'))),
                    ]),
                    DataRow(cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('ss'))),
                      DataCell(Center(child: Text('ss'))),
                    ]),
                    DataRow(cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('ss'))),
                      DataCell(Center(child: Text('ss'))),
                    ]),
                    DataRow(cells: [
                      DataCell(Center(child: Text('1'))),
                      DataCell(Center(child: Text('ss'))),
                      DataCell(Center(child: Text('ss'))),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
