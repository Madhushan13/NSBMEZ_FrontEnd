import 'package:flutter/material.dart';
import 'Home_widget.dart';
import 'events_page.dart';
import 'qr_scanner.dart';
import 'time_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 236, 236),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const CarouselWithIndicator(),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // First Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QRScanner(),
                                  ),
                                );
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/Qr.gif',
                                width: 50,
                                height: 50,
                                onTap: () {},
                              ),
                            ),
                            const Text(
                              'QR Scanner',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 5, 5, 5),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your navigation logic here
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/attendance.gif',
                                width: 50,
                                height: 50,
                                onTap: () {},
                              ),
                            ),
                            const Text(
                              'Attendance',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 9, 10, 10),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TimeTable(),
                                  ),
                                );
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/time table1.gif',
                                width: 50,
                                height: 50,
                                onTap: () {},
                              ),
                            ),
                            const Text(
                              'Academic Time Table',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 6, 9, 11),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your navigation logic here
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/payment1.gif',
                                width: 50,
                                height: 50,
                                onTap: () {},
                              ),
                            ),
                            const Text(
                              'Payments',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 3, 5, 7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Second Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventsPage(),
                                  ),
                                );
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/events.gif',
                                onTap: () {},
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text(
                              'Events',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 10, 11, 11),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your navigation logic here
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/transport.gif',
                                onTap: () {},
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text(
                              'Transport',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 2, 3, 4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your navigation logic here
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/gpa cal.gif',
                                onTap: () {},
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text(
                              'GPA Calculator',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 9, 12, 14),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your navigation logic here
                              },
                              child: GifImageWidget(
                                gifImagePath: 'assets/images/result.gif',
                                onTap: () {},
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text(
                              'Result',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 6, 7, 7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // ... (other code)

                    // Lecture Details Container
                    const LectureDetailsContainer(
                      startTime: '8:00 AM',
                      endTime: '10:00 AM',
                      lectureName: 'Mathematics',
                      lectureHall: 'Room 201',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Add your search functionality here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Search icon pressed')),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
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
      ),
    );
  }
}
