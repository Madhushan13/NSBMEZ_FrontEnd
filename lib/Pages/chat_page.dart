import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/Pages/home_page.dart';
import 'package:http/http.dart' as http;

class ChatDialog extends StatefulWidget {
  @override
  _ChatDialogState createState() => _ChatDialogState();
}

class _ChatDialogState extends State<ChatDialog> {
  List<ChatMessage> messages = [];

  // Replace with your API key and API endpoint
  final String apiKey = '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';
  final String apiUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchChatMessages();
  }

  Future<void> fetchChatMessages() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          messages = data['choices'][0]['message']['content']
              .map<ChatMessage>((messageData) => ChatMessage(
                    isMe:
                        false, // Assuming all messages fetched are from the AI
                    text: messageData,
                  ))
              .toList();
        });
      } else {
        throw Exception('Failed to fetch chat messages');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> sendMessage(String text) async {
    setState(() {
      messages.add(ChatMessage(
        isMe: true,
        text: textController.text,
      ));
    });
    textController.clear();
    // try {
    //   final response = await http.post(
    //     Uri.parse(apiUrl),
    //     headers: {
    //       'Authorization': 'Bearer $apiKey',
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode({
    //       'prompt': text,
    //       'max_tokens': 50, // You can adjust the max_tokens as needed
    //     }),
    //   );

    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> data = json.decode(response.body);
    //     final String generatedMessage = data['choices'][0]['text'];

    //     setState(() {
    //       messages.add(ChatMessage(
    //         isMe: true, // Assuming the user's message
    //         text: generatedMessage,
    //       ));
    //     });
    //   } else {
    //     throw Exception('Failed to send message');
    //   }
    // } catch (error) {
    //   print(error);
    // }
  }

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
              Navigator.pop(context); // Close the dialog
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
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return messages[index];
                },
              ),
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sendMessage(textController.text);
                textController.clear();
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
