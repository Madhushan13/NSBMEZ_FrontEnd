import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class SendMail extends StatefulWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  State<SendMail> createState() => _SendMailState();
}

class _SendMailState extends State<SendMail> {
  final TextEditingController _recipientEmailController =
      TextEditingController();
  final TextEditingController _mailMessageController = TextEditingController();

  // Send Mail function
  void sendMail({
    required String recipientEmail,
    required String mailMessage,
  }) async {
    // change your email here
    String username = 'eznsbm@gmail.com';
    // change your password here
    String password = 'zpep avsp mjoe yogp';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Mail '
      ..text = 'Message: $mailMessage';

    try {
      await send(message, smtpServer);
      showSnackbar('Email sent successfully');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Mailer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Recipient Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              controller: _recipientEmailController,
            ),
            const SizedBox(height: 30),
            TextFormField(
              maxLines: 5,
              controller: _mailMessageController,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  sendMail(
                    recipientEmail: _recipientEmailController.text.toString(),
                    mailMessage: _mailMessageController.text.toString(),
                  );
                },
                child: const Text('Send Mail'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FittedBox(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
