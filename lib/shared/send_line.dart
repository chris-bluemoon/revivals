import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/shared/line.dart';
import 'package:url_launcher/url_launcher.dart';


class SendLine extends StatelessWidget {
  const SendLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () async {
          log('Tapped LINE send');
      try {
        await openLineApp(
          phone: '+660623271758',
          text: 'Initial text',
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