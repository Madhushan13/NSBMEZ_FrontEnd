import 'package:flutter/material.dart';

class Homepage1 extends StatelessWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: 200,
                child: PageView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildCurvedCard(context, 'asset/now1.jpeg'),
                    _buildCurvedCard(context, 'asset/now2.jpeg'),
                    _buildCurvedCard(context, 'asset/now3.jpeg'),
                    _buildCurvedCard(context, 'asset/now4.jpeg'),
                    _buildCurvedCard(context, 'asset/now5.jpeg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment
                      .spaceEvenly, // Add this line for even spacing within each row
                  children: [
                    HomeCard(
                      icon: Icons.notifications,
                      label: 'Notification',
                      onTap: () {
                        // Add your navigation logic here
                      },
                    ),
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
                      },
                    ),
                    HomeCard(
                      icon: Icons.access_time,
                      label: 'Attendance',
                      onTap: () {
                        // Add your navigation logic here
                      },
                    ),
                    HomeCard(
                      icon: Icons.table_chart,
                      label: 'Time Table',
                      onTap: () {
                        // Add your navigation logic here
                      },
                    ),
                    HomeCard(
                      icon: Icons.event,
                      label: 'Events',
                      onTap: () {
                        // Add your navigation logic here
                      },
                    ),
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

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeCard(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCurvedCard(BuildContext context, String assetPath) {
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    ),
  );
}
