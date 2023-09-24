import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application/Pages/sendmail.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'Home_widget.dart';
import 'attendance_utils.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

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
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
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
        body: const Center(
          child: SubjectList(),
        ),
      ),
    );
  }
}

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, pairIndex) {
        final subjectIndex1 = pairIndex * 2 + 1;
        final subjectIndex2 = pairIndex * 2 + 2;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubjectAttendanceDetails(subjectIndex: subjectIndex1),
                  ),
                );
              },
              child: SubjectCard(subjectIndex: subjectIndex1),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubjectAttendanceDetails(subjectIndex: subjectIndex2),
                  ),
                );
              },
              child: SubjectCard(subjectIndex: subjectIndex2),
            ),
          ],
        );
      },
    );
  }
}

class SubjectCard extends StatelessWidget {
  final int subjectIndex;
  final double attendancePercentage;

  SubjectCard({super.key, required this.subjectIndex})
      : attendancePercentage =
            AttendanceUtils.calculateTotalAttendancePercentage(subjectIndex);

  @override
  Widget build(BuildContext context) {
    Color progressColor;

    if (attendancePercentage < 50.0) {
      progressColor = Colors.red;
    } else {
      progressColor = const Color.fromARGB(255, 27, 206, 39);
    }

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Subject $subjectIndex',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 8.0,
              percent: attendancePercentage / 100,
              center: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    '${attendancePercentage.toStringAsFixed(1)}%',
                    textStyle: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 500),
                  ),
                ],
              ),
              progressColor:
                  progressColor, // Use the dynamically determined color
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectAttendanceDetails extends StatelessWidget {
  final int subjectIndex;

  const SubjectAttendanceDetails({super.key, required this.subjectIndex});

  @override
  Widget build(BuildContext context) {
    final double totalAttendancePercentage =
        AttendanceUtils.calculateTotalAttendancePercentage(subjectIndex);

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
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Attendance Details for Subject $subjectIndex',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Date'),
                    ),
                    DataColumn(
                      label: Text('Lecture'),
                    ),
                    DataColumn(
                      label: Text('Status'),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    15,
                    (index) {
                      final bool isPresent = index % 3 == 0;
                      final String date = 'Day ${index + 1}';
                      final String lecture = 'Lecture ${index + 1}';
                      final String status = isPresent ? 'Present' : 'Absent';
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(date)),
                          DataCell(Text(lecture)),
                          DataCell(Text(status)),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total Attendance Percentage: ${totalAttendancePercentage.toStringAsFixed(1)}%',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
