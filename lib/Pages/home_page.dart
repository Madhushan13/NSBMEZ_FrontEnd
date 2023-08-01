import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'qr_scanner.dart';

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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: 200,
                child: CarouselSlider(
                  items: [
                    _buildCurvedCard(context, 'assets/images/now1.jpeg'),
                    _buildCurvedCard(context, 'assets/images/now2.jpeg'),
                    _buildCurvedCard(context, 'assets/images/now3.jpeg'),
                    _buildCurvedCard(context, 'assets/images/now4.jpeg'),
                    _buildCurvedCard(context, 'assets/images/now5.jpeg'),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Page indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildPageIndicator(),
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

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      controller: PageController(viewportFraction: 0.8, initialPage: 0),
      count: 5, // Number of carousel images
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Colors.blue,
        dotColor: Colors.grey,
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * 0.3, // Fixed width for the card
      height: 120, // Fixed height for the card
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 30,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align text to the bottom
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: const Color.fromARGB(255, 74, 187, 9),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                    color: Color.fromARGB(255, 6, 129, 245),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
