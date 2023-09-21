import 'package:flutter/material.dart';

class ChatDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Chat Popup'),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Handle closing the chat dialog here
              Navigator.of(context).pop(); // Close the dialog
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle sending message here
              },
              child: Text('Send'),
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
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
