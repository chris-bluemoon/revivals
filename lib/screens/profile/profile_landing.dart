import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/profile/profile_landing.dart';

class ProfileLanding extends StatelessWidget {
  const ProfileLanding(this.user, this.signOutFromGoogle, {super.key});

  final User? user;
  final Function() signOutFromGoogle;

  @override
  Widget build(BuildContext context) {
    ValueNotifier userCredential = ValueNotifier('');
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,20.0,0,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PERSONAL (${user!.displayName!})', style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle)),
              Text('MY ACCOUNT'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.woman_2_outlined)),
              Text('MY RENTALS'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.description)),
              Text('INVOICE HISTORY'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.group_add)),
              Text('REFER A FRIEND'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle)),
              Text('NOTIFICATIONS'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
           Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings)),
              Text('SETTINGS'),
            ],
          ),

          const SizedBox(height: 20),
          const Text('SUPPORT', style: TextStyle(fontSize: 16),),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle)),
              const Text('FAQ'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
           Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {log('Pressed');},
                icon: Icon(Icons.chat_bubble_rounded)),
              Text('CHAT WITH US'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () async {
                  bool result = await signOutFromGoogle();
                  if (result) userCredential.value = '';
                },
                icon: Icon(Icons.exit_to_app)),
              Text('SIGN OUT'),
            ],
          ),
        ],),
    );
  }
}