import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';

import 'Home_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text(
              'Events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
