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
            title: const Text('Results'),
            actions: [
              // Notification Icon
              IconButton(
                onPressed: () {
                  // Add your notification logic here
                },
                icon: const Icon(Icons.notifications),
              ),
              // EndDrawer Icon
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('John Doe'),
                  accountEmail: Text('johndoe@example.com'),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    // Add your profile navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.directions_bus),
                  title: const Text('Transport Service'),
                  onTap: () {
                    // Add your transport service navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.table_chart),
                  title: const Text('Time Table'),
                  onTap: () {
                    // Add your time table navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.qr_code),
                  title: const Text('Take Attendance/QR'),
                  onTap: () {
                    // Add your attendance/QR navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.event),
                  title: const Text('Events'),
                  onTap: () {
                    // Add your events navigation logic here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.poll),
                  title: const Text('Result'),
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
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Column(
              children: [
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
