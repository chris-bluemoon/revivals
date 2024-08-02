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
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.account_circle),
              SizedBox(width: 20),
              Text('MY ACCOUNT'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.woman_2_outlined),
              SizedBox(width: 20),
              Text('MY RENTALS'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.description),
              SizedBox(width: 20),
              Text('INVOICE HISTORY'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.group_add),
              SizedBox(width: 20),
              Text('REFER A FRIEND'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.account_circle),
              SizedBox(width: 20),
              Text('NOTIFICATIONS'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.settings),
              SizedBox(width: 20),
              Text('SETTINGS'),
            ],
          ),
          const SizedBox(height: 40),
          const Text('SUPPORT', style: TextStyle(fontSize: 16),),
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.account_circle),
              SizedBox(width: 20),
              Text('NOTIFICATIONS'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.chat_bubble_rounded),
              SizedBox(width: 20),
              Text('CHAT WITH US'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),
          const Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.exit_to_app),
              SizedBox(width: 20),
              Text('SIGN OUT'),
            ],
          ),
          Divider(indent: 50, color: Colors.grey[200],),



          const Expanded(child: SizedBox()),
          ElevatedButton(
            onPressed: () async {
              bool result = await signOutFromGoogle();
              if (result) userCredential.value = '';
                },
              child: const Text('Logout')
            ),

            
        ],),
    );
  }
}