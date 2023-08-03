import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/all_widget_class.dart';
import 'events_page.dart';
import 'qr_scanner.dart';
import 'time_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeCard(
                          icon: Icons.calendar_today,
                          label: 'Academic Calendar',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.qr_code_scanner,
                          label: 'QR Scanner',
                          onTap: () {
                            // Add your navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QRScanner(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeCard(
                          icon: Icons.access_time,
                          label: 'Attendance',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.table_chart,
                          label: 'Lecture Time Table',
                          onTap: () {
                            // Add your navigation logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TimeTable(),
                              ),
                            );
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.event,
                          label: 'Events',
                          onTap: () {
                            // Add your navigation logic here
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventsPage(),
                                ));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeCard(
                          icon: Icons.calculate,
                          label: 'GPA Calculator',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.poll,
                          label: 'Result',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.account_balance_wallet,
                          label: 'My Account',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeCard(
                          icon: Icons.directions_bus,
                          label: 'Transport',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.chat,
                          label: 'Chat',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                        HomeCard(
                          icon: Icons.chat,
                          label: 'Payments',
                          onTap: () {
                            // Add your navigation logic here
                          },
                        ),
                      ],
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
