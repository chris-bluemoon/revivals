import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
 
    return Scaffold(
            appBar: AppBar(
        // centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          // TODO: Image is not centered in appbar with back arrow
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledTitle('SETTINGS', weight: FontWeight.normal),
              ]),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width*0.06),
          onPressed: () {
            Navigator.pop(context);
          },
      ),),
    );
  }
}