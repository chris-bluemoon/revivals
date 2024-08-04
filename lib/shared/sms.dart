import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/shared/send_sms.dart';
import 'package:url_launcher/url_launcher.dart';

class Sms extends StatelessWidget {
  const Sms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.dangerous),
          onPressed: () async {
            log('Tapped');
            try {
              await openSMS(
                phone: '+66 (62) 327-1758',
                text: 'Initial text',
              );
            } on Exception catch (e) {
              showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                        title: Text("Attention"),
                        content: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: const Text(
                            'We did not find the «SMS Messenger» application on your phone, please install it and try again»',
                          ),
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('Close'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ));
            }
          },
        )
      ],
    );
  }
}



