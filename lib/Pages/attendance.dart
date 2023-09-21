import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'attendance_utils.dart';
import 'login_page.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              progressColor: Color.fromARGB(255, 27, 206, 39),
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
