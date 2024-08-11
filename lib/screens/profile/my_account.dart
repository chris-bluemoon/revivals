import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/screens/home/home.dart';
import 'dart:developer';

import 'package:unearthed/screens/home/my_app_client.dart';
import 'package:unearthed/screens/profile/profile.dart';
import 'package:unearthed/screens/profile/profile_landing.dart';
import 'package:unearthed/shared/send_whatsapp.dart';
import 'package:unearthed/shared/whatsapp.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/models/renter.dart';


class MyAccount extends StatefulWidget {
  const MyAccount(this.user, {super.key});

  final User? user;

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  

  late TextEditingController _addressController;
  late TextEditingController _phoneNumController;
  bool editingMode = false;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: 'Dummy address value');
    _phoneNumController = TextEditingController(text: 'Dummy phoneNum value');
    // _aditemController = new TextEditingController(text: 'Initial value');
  }
  
  @override
  Widget build(BuildContext context) {

    // String address = Provider.of<ItemStore>(context, listen: false).renters[0].address;
    String address = Provider.of<ItemStore>(context, listen: false).renter.address;
    String phoneNum = Provider.of<ItemStore>(context, listen: false).renter.phoneNum;

    _addressController = TextEditingController(text: address);
    _phoneNumController = TextEditingController(text: phoneNum);
    // ValueNotifier userCredential = ValueNotifier('');
    SnackBar snackBar = SnackBar(
  content: Center(child: Text('Data Saved', style: TextStyle(color: Colors.black, fontSize: 16))),
  backgroundColor: Colors.grey[100],
  behavior: SnackBarBehavior.fixed,
//  shape: RoundedRectangleBorder
  //  (borderRadius:BorderRadius.circular(50),
      // ),
);

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          // TODO: Image is not centered in appbar with back arrow
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ACCOUNT', style: TextStyle(fontSize: 22))
              ]),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,20.0,0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NAME', style: TextStyle(fontSize: 12, color: Colors.grey[700]),),
            TextFormField(
              cursorColor: Colors.white,
              initialValue: widget.user!.displayName,
              // initialValue: 'John Doe',
              enabled: false,
            ),
              // value: Text('NAME: ${widget.user!.displayName!}', style: const TextStyle(fontSize: 14)),
            // ),
            SizedBox(height: 30),
            Text('EMAIL', style: TextStyle(fontSize: 12, color: Colors.grey[700]),),
            TextFormField(
              // initialValue: 'johndoe@gmail.com',
              initialValue: widget.user!.email,
              enabled: false,
            ),
            SizedBox(height: 30),

            Text('ADDRESS', style: TextStyle(fontSize: 12, color: Colors.grey),),
                        TextFormField(
              enableInteractiveSelection: false,
              decoration: const InputDecoration(        
              // counterText: '1111', 
              enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.grey),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                   ),  
             ),
              cursorColor: Colors.black,
              controller: _addressController,
              enabled: editingMode,
            ),
            SizedBox(height: 30),

            Text('PHONE', style: TextStyle(fontSize: 12, color: Colors.grey),),
            TextFormField(
              enableInteractiveSelection: false,
              decoration: const InputDecoration(        
              // counterText: '1111', 
              enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.grey),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                   ),  
             ),
              cursorColor: Colors.black,
              controller: _phoneNumController,
              enabled: editingMode,
            ),
          ],),
      ),
            bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                if (!editingMode) Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() { 
                        editingMode = true; 
                      });
                    },
                    child: const Text('EDIT', style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: BorderSide(width: 1.0, color: Colors.black),
                      ),
                  ),
                ),
                SizedBox(width: 5),
                if (editingMode) Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    Renter toSave = Provider.of<ItemStore>(context, listen: false).renter;
                    log('toSave renter: ${toSave.name}');
                    log('Renters current address: ${toSave.address}');
                    log('Renters current phoneNum: ${toSave.phoneNum}');
                    log('Renters id: ${toSave.id}');
                    log(_addressController.value.text);
                    log(_phoneNumController.value.text);
                    log('Renters NEW address: ${_addressController.value.text}');
                    log('Renters NEW phoneNum: ${_phoneNumController.value.text}');
                    toSave.address = _addressController.value.text;
                    toSave.phoneNum = _phoneNumController.value.text;
                    log('Showing the id of the user');
                    log(toSave.id);
                        Provider.of<ItemStore>(context, listen: false).saveRenter(toSave);
                    setState(() {
                      editingMode = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('SAVE', style: TextStyle(color: Colors.white)),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      side: BorderSide(width: 1.0, color: Colors.black),
                      ),
                  ),
                ),
              ],
            ),
          ),   
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
    // content: Text("      Your item is being prepared"),  
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