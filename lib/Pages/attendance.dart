import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'attendance_utils.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Tracker'),
      ),
      body: const Center(
        child: SubjectList(),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Subject $subjectIndex Attendance Details'),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Attendance Details for Subject $subjectIndex',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
