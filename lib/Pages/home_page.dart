import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/gpa_calculater.dart';
import 'package:flutter_application/Pages/login_page.dart';
import 'package:flutter_application/Pages/payment_details.dart';
import 'package:flutter_application/Pages/results_page.dart';
import 'package:flutter_application/Pages/sendmail.dart';
import 'Home_widget.dart';
import 'attendance.dart';
import 'bus_tracking_page.dart';
import 'chat_page.dart';
import 'events_page.dart';
import 'qr_scanner.dart';
import 'time_table.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDialog(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
        ),
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
                width: 150,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.white, // Change the background color as needed
            child: Column(
              children: [
                Image.asset(
                  'assets/images/NSBMEZ Black.png',
                  height: 100,
                  width: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text('Student Support'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendMail(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
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
                      (route) => false,
                    );
                  },
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to the settings page
                  },
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: displayWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Container(
                  child: const CarouselWithIndicator(),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(
                    //   color: Color.fromARGB(255, 6, 134, 247),
                    //   width: 5,
                    // ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      // First Row
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 4, 6, 5),
                            width: 2,
                          ),
                        ),
                        child: Row(
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
                                    color: Color.fromARGB(255, 7, 6, 9),
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
                                        builder: (context) =>
                                            const AttendanceScreen(),
                                      ),
                                    );
                                    // Add your navigation logic here
                                  },
                                  child: GifImageWidget(
                                    gifImagePath:
                                        'assets/images/attendance.gif',
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
                                    gifImagePath:
                                        'assets/images/time table1.gif',
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Online_Payment(),
                                      ),
                                    );
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
                      ),

                      const SizedBox(height: 20),

                      // Second Row
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 4, 4, 5),
                            width: 2,
                          ),
                        ),
                        child: Row(
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BusTrackingPage(),
                                      ),
                                    );
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const GPACalculatorPage(),
                                      ),
                                    );

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
                                    //SIGN UP LINK
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResultsPage()));
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Additional Container with Related Text
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 4, 4, 5),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 190),
                        child: const Text(
                          "How's it Going Today?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 1, 1, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Lecture Details Container
                      // First Lecture Details Container
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 4, 4, 5),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(5),

                        // Set the background color to red
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              child: const LectureDetails(
                                moduleName: 'MAD',
                                moduleCode: 'SE101.3',
                                hall: 'C2',
                                time: '9 AM-1 PM',
                              ),
                            ),
                            const SizedBox(height: 1),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const LectureDetails(
                                moduleName: 'IAS',
                                moduleCode: 'SE204.3',
                                hall: 'C5',
                                time: '1 AM-5 PM',
                              ),
                            ),
                            const SizedBox(height: 1),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const LectureDetails(
                                moduleName: 'LAB IAS',
                                moduleCode: 'SE101.3',
                                hall: 'C7',
                                time: '9 AM-1 PM',
                              ),
                            ),
                            const SizedBox(
                                height:
                                    1), // Add spacing between the two LectureDetails
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const LectureDetails(
                                moduleName: 'Crypto',
                                moduleCode: 'SE207.3',
                                hall: 'C1',
                                time: '2 PM-5 PM',
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Add spacing between the two LectureDetails
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
