import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
import 'package:flutter_application/Pages/sendmail.dart';

import 'Home_widget.dart';
import 'chat_page.dart';
import 'login_page.dart';

class EventsPage extends StatelessWidget {
  // Sample event data
  final List<Map<String, String>> events = [
    {
      'date': '24',
      'month': 'Nov',
      'year': '2023',
      'title': 'ICOBI 2023',
      'description':
          'ICOBI 2023 is the sixth International Conference on Business Innovation that will be held at NSBM Green University of Sri Lanka. ICOBI has been held annually since 2018, structured each year on an impactful and timely theme related to Business Innovation and Sustainable Development',
      'imageUrl': 'assets/images/icobievent-jpg-1.png',
    },
    {
      'date': '02',
      'month': 'Aug',
      'year': '2023',
      'title': '"Emotion 4"',
      'description':
          '“Emotion 4” the grand drama show presented by the NSBM Drama Club for the year 2023 was held on the 31st July 2023 at NSBM Auditorium. Bringing the Horror theme to life, the 2023 edition of this annual show was named “The Spirits Have a Message”. ',
      'imageUrl': 'assets/images/Emotion4-drama-club9.jpg',
    },
    {
      'date': '31',
      'month': 'Jul',
      'year': '2023',
      'title': '"Green Base" night camp',
      'description':
          '“Green Base”, the night camp organised by the Association of Business Management had its 2023 chapter which continued for two successful days on 28th and 29th July 2023 at NSBM Grounds.',
      'imageUrl': 'assets/images/Green Base night camp.jpg',
    },
    // Add more sample events here
  ];

  EventsPage({super.key});

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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventCard(
                    date: event['date']!,
                    month: event['month']!,
                    year: event['year']!,
                    title: event['title']!,
                    description: event['description']!,
                    imageUrl: event['imageUrl']!,
                  );
                },
              ),
            ),
          ],
        ),
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
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String date;
  final String month;
  final String year;
  final String title;
  final String description;
  final String imageUrl;

  const EventCard({
    Key? key,
    required this.date,
    required this.month,
    required this.year,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.calendar_today, // Calendar icon
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    '$date $month $year',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF2D51AC), // #2D51AC
                      fontFamily: 'Arial',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.black, // #000000
                fontFamily: 'Arial',
                fontSize: 13,
              ),
            ),
          ),
          Image.asset(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
