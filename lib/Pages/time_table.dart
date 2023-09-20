import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'Home_widget.dart';
import 'home_page.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Day and Week views)
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Time Table'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Day View'),
                Tab(text: 'Week View'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Day View
              SfCalendar(
                view: CalendarView.day,
                firstDayOfWeek: 1,
                dataSource: MeetingDateSource(getAppointments()),
              ),
              // Week View
              SfCalendar(
                view: CalendarView.week,
                firstDayOfWeek: 1,
                dataSource: MeetingDateSource(getAppointments()),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: 2, // Set the correct index for EventsPage
            onTap: (index) {
              // Handle bottom navigation bar tap event
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

List<Appointment> getAppointments() {
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
  
  // Add more appointments for day and week views as needed

  return meetings;
}

class MeetingDateSource extends CalendarDataSource {
  MeetingDateSource(List<Appointment> source) {
    appointments = source;
  }
}
