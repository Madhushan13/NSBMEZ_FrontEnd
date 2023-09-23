import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';

class ChatDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Chat Popup'),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Handle closing the chat dialog here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ); // Close the dialog
            },
          ),
        ],
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ChatMessage(isMe: true, text: 'Hello!'),
                  ChatMessage(isMe: false, text: 'Hi there!'),
                  ChatMessage(isMe: true, text: 'How are you?'),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle sending message here
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isMe;
  final String text;

  ChatMessage({required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
