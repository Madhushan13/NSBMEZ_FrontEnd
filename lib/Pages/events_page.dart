import 'package:flutter/material.dart';


class EventsPage extends StatelessWidget {
  // Sample event data
  final List<Map<String, String>> events = [
    {
      'date': '10',
      'month': 'Aug',
      'year': '2023',
      'title': 'NSBM Sport Fiesta 2023',
      'description': 'The Sports Fiesta 2023 organized by theNSBM Green University will behappening from the 20th of February 2023 to the 16th March 2023.',
      'imageUrl': 'assets/n-1.png',

    },
    {
      'date': '15',
      'month': 'Aug',
      'year': '2023',
      'title': 'NSBM Sport Fiesta 2023',
      'description':'NSBM Green University will behappening from the 20th of February 2023 to the 16th March 2023.',
      'imageUrl': 'assets/icobievent-jpg-1.png',

    },
    {
      'date': '20',
      'month': 'Aug',
      'year': '2023',
      'title': 'Event 3',
      'description': 'In a quaint little town nestled amidst rolling hills and lush greenery, life seemed to slow down. The townsfolk would gather at the charming café to savor aromatic coffee and share stories of days gone by. Children laughed and played in the cobblestone streets, echoing the joy of a simpler time. Beyond the towns borders, a majestic forest beckoned with its mysterious allure. The sunlight filtered through the canopy, casting a magical glow on the forest floor. Natures symphony filled the air as birds sang in harmony. It was a place where worries faded, and the beauty of life took center stage',
      'imageUrl': 'assets/n-1.png',
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
          Image.network(
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
