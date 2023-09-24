import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/sendmail.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'Home_widget.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

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
        body: SfCalendar(
          view: CalendarView.week,
          firstDayOfWeek: 1,
          //initialDisplayDate: DateTime(2023, 06, 05, 09, 00, 00),
          //initialSelectedDate: DateTime(2023, 06, 05, 09, 00, 00),
          dataSource: MeetingDateSource(getAppoinments()),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2, // Set the correct index for EventsPage
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
      ),
    );
  }
}

List<Appointment> getAppoinments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0); // Start at 9 am
  final DateTime endTime =
      DateTime(today.year, today.month, today.day, 12, 0, 0); // End at 12 pm

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'MAD',
    color: Colors.yellow,
    recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;COUNT=03',
  ));
  return meetings;
}

class MeetingDateSource extends CalendarDataSource {
  MeetingDateSource(List<Appointment> source) {
    appointments = source;
  }
}
