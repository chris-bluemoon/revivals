import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailComposer extends StatefulWidget {
  const EmailComposer({super.key});

  @override
  _EmailComposerState createState() => _EmailComposerState();
}

class _EmailComposerState extends State<EmailComposer> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  Future<void> sendEmail() async {
    final smtpServer = SmtpServer('smtp.gmail.com',
        username: 'uneartheduser@gmail.com', password: '');

    final message = Message()
      ..from = const Address('uneartheduser@gmail.com', 'Unearthed User')
      ..recipients.add(_toController.text)
      ..subject = _subjectController.text
      ..text = _bodyController.text;

    try {
      final sendReport = await send(message, smtpServer);
      // print('Message sent: ${sendReport.sent}');
      log('Message sent: ${sendReport.toString()}');
      // Additional code for feedback to the user
    } catch (e) {
      log('Error occurred while sending email: $e');
      // Additional code for error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _toController,
              decoration: const InputDecoration(
                labelText: 'To',
              ),
            ),
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
              ),
            ),
            TextField(
              controller: _bodyController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: 'Body',
              ),
            ),
            ElevatedButton(
              onPressed: sendEmail,
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
