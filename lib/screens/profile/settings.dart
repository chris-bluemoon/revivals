import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/profile/country_selector.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/styled_text.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

late Container flag;

class _SettingsState extends State<Settings> {

List<Widget> lengths = <Widget>[
  const Text('CM'),
  const Text('INCH')
];
List<Widget> heights = <Widget>[
  const Text('CM'),
  const Text('FT')
];
List<Widget> weights = <Widget>[
  const Text('KG'),
  const Text('LBS')
];

    final List<bool> selectedLength = <bool>[true, false];
    final List<bool> selectedHeight = <bool>[true, false];
    final List<bool> selectedWeight = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const StyledTitle('SETTINGS', weight: FontWeight.normal),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: width * 0.06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<ItemStore>(
        builder: (context, value, child) {
          String region = Provider.of<ItemStore>(context, listen: false).region;
          if (region == 'BANGKOK') {
            flag = Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              child: Image.asset('icons/flags/png100px/th.png',
                  package: 'country_icons'),
            );
          } else {
            flag = Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              child: Image.asset('icons/flags/png100px/sg.png',
                  package: 'country_icons'),
            );
          }
          return Padding(
            padding:
                EdgeInsets.fromLTRB(width * 0.05, width * 0.1, width * 0.05, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StyledBody('DEFAULT MEASUREMENT UNITS', color: Colors.grey,
                    weight: FontWeight.normal),
                SizedBox(height: width * 0.02),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: width * 0.03),
                        const StyledBody('LENGTH', weight: FontWeight.normal),
                        const Expanded(child: SizedBox()),
                        ToggleButtons(
                          direction: Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              // The button that is tapped is set to true, and the others to false.
                              for (int i = 0; i < selectedLength.length; i++) {
                                selectedLength[i] = i == index;
                              }
                            });
                          },
                          textStyle: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.bold),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                          selectedBorderColor: Colors.black,
                          selectedColor: Colors.black,
                          fillColor: Colors.grey[300],
                          color: Colors.grey,
                          constraints: BoxConstraints(
                            minHeight: width * 0.08,
                            minWidth: width * 0.16
                          ),
                          isSelected: selectedLength,
                          children: lengths,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                                Row(
                  children: [
                      SizedBox(width: width * 0.03),
                    const StyledBody('HEIGHT', weight: FontWeight.normal),
                    const Expanded(child: SizedBox()),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < selectedHeight.length; i++) {
                            selectedHeight[i] = i == index;
                          }
                        });
                      },
                      textStyle: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.bold),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0)),
                      selectedBorderColor: Colors.black,
                      selectedColor: Colors.black,
                      fillColor: Colors.grey[300],
                      color: Colors.grey,
                      constraints: BoxConstraints(
                        minHeight: width * 0.08,
                        minWidth: width * 0.16
                      ),
                      isSelected: selectedHeight,
                      children: heights,
                    ),
                  ],
                ),
                const Divider(),
                                Row(
                  children: [
                      SizedBox(width: width * 0.03),
                    const StyledBody('WEIGHT', weight: FontWeight.normal),
                    const Expanded(child: SizedBox(width: 100)),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < selectedWeight.length; i++) {
                            selectedWeight[i] = i == index;
                          }
                        });
                      },
                      textStyle: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.bold),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0)),
                      selectedBorderColor: Colors.black,
                      selectedColor: Colors.black,
                      fillColor: Colors.grey[300],
                      color: Colors.grey,
                      constraints: BoxConstraints(
                        minHeight: width * 0.08,
                        minWidth: width * 0.16
                      ),
                      isSelected: selectedWeight,
                      children: weights,
                    ),
                  ],
                ),
                const Divider(),
                SizedBox(height: width * 0.1),
                const StyledBody('COUNTRY', color: Colors.grey, weight: FontWeight.normal),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => (const CountrySelector())));
                  },
                  child: Row(
                    children: [
                      // Image.asset('icons/flags/png100/de.png', package: 'country_icons'),
                      // Image.asset('icons/flags/svg/de.svg', package: 'country_icons'),
                      SizedBox(width: width * 0.03),
                      SizedBox(
                        height: width * 0.04,
                        child: flag,
                      ),
                      SizedBox(width: width * 0.02),
                      StyledBody(region, weight: FontWeight.normal),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
