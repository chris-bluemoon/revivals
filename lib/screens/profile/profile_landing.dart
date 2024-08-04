import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unearthed/screens/home/home.dart';
import 'dart:developer';

import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:unearthed/screens/profile/profile_landing.dart';
import 'package:unearthed/screens/profile/my_account.dart';
import 'package:unearthed/shared/send_whatsapp.dart';
import 'package:unearthed/shared/whatsapp.dart';

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
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (MyAccount(user))));
                },
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
          SizedBox(height: 5),
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
                onPressed: () {
                  log('Pressed Chat With Us');
                  chatWithUsMessage(context);},
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
                  showAlertDialog(context);
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (Home())));
                },
                icon: Icon(Icons.exit_to_app)),
              Text('SIGN OUT'),
            ],
          ),
        ],),
    );
  }
}

  // Send a Whatsapp
void chatWithUsMessage(BuildContext context) async {
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
}

showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = ElevatedButton(  
    child: Center(child: Text("OK")),  
    onPressed: () {  
      // Navigator.of(context).pop();  
      log("Should be about to pop to first");
      Navigator.of(context).popUntil((route) => route.isFirst);
    },  
  ); 
    // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Center(child: Text("SIGNED OUT")),
    // content: Text("      Your dress is being prepared"),  
    actions: [  
      okButton,  
    ],  
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
  );  
    showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );


}
  


