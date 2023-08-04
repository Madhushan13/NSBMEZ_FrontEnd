import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'all_widget_class.dart';
import 'events_page.dart';
import 'qr_scanner.dart';
import 'time_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 1, 37),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const CarouselWithIndicator(),
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
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
                            ),
                            const Text(
                              'Academic Calendar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 6, 1210, 245),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QRScanner(),
                                  ),
                                );
                              },
                              label: '',
                            ),
                            const Text(
                              'QR Scanner',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 1, 14, 18),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
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
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TimeTable(),
                                  ),
                                );
                              },
                              label: '',
                            ),
                            const Text(
                              'Lecture Time Table',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 6, 9, 11),
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
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventsPage(),
                                  ),
                                );
                              },
                              label: '',
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
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
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
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
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
                        Column(
                          children: [
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
                            ),
                            const Text(
                              'My Account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 4, 10, 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Third Row

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
                            ),
                            const Text(
                              'Transport',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 6, 1210, 245),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RoundedHomeCard(
                              gifImagePath: 'assets/images/calender.gif',
                              onTap: () {
                                // Add your navigation logic here
                              },
                              label: '',
                            ),
                            const Text(
                              'Payments',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color.fromARGB(255, 6, 1210, 245),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

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
                const Text('Search icon pressed');
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
