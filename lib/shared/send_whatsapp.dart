import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/shared/whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';


class SendWhatsapp extends StatelessWidget {
  const SendWhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () async {
          log('Tapped whatsapp send');
      try {
        await openWhatsApp(
          phone: '+65 91682725',
          text: 'Hello Unearthed Support...',
        );
      } on Exception catch (e) {
        showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text("Attention"),
            content: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('${e.toString()}'
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          )
        );
      }
        },
        icon: Icon(Icons.account_box),
      ),
    );
  }
}
