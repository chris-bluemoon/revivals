import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:unearthed/shared/secure_repo.dart';

class EmailComposer2 {
  EmailComposer2(this.userMessage, this.userSubject, this.emailAddress);

  String userMessage;
  String userSubject;
  String emailAddress;

  MyStore myStore = MyStore();

  Future<void> sendEmail2() async {
    Future myToken = MyStore.readFromStore();
    String? myvar = await MyStore.readFromStore();
    final smtpServer = SmtpServer('smtp.gmail.com',
        username: 'uneartheduser@gmail.com', password: myvar);

    final message = Message()
      ..from = const Address('uneartheduser@gmail.com', 'Unearthed User')
      ..recipients.add(emailAddress)
      ..subject = userSubject
      ..text = userMessage;


    try {
      final sendReport = await send(message, smtpServer);
      // print('Message sent: ${sendReport.sent}');
      log('Message sent: ${sendReport.toString()}');
      // Additional code for feedback to the user
    } catch (e) {
      log('Error occurred xwhile sending email: $e');
      // Additional code for error handling
    }
  }

}
