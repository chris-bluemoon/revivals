import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';

String testString = 'THB';

List<Item> faqs = [
  Item(headerValue: "Does Unearthed have a studio?", expandedValue: "Want to try something on? Click on the 'APPOINTMENTS' tab under Contact Us in our header menu to arrange a 45 minute fitting session in our boutique."),
  // Item(headerValue: "Do you deliver?", expandedValue: "Yes, we can arrange delivery for a small fee, usually 100$testString within the Bangkok area, alternatively you can arrange your own collection, just contact us to arrange."),
  Item(headerValue: "Do you deliver?", expandedValue: "(SIGH) YES WE DELIVER..."),
  Item(headerValue: "Do you ship internationally?", expandedValue: "We can ship to most SE Asian countries, please contact us to arrange international shipment."),
  Item(headerValue: "How long can I keep my item?", expandedValue: "We rent items for 1, 3 and 5 days, for longer terms, please contact and we will check extended availability."),
  Item(headerValue: "I need a dress delivered today!", expandedValue: "For last minute rentals, please contact us on LINE!"),
  Item(headerValue: "Can I reserve in advance?", expandedValue: "Yes, please use the app once registered or contact us on LINE to book your item."),
  Item(headerValue: "Do you provide alterations?", expandedValue: "Unfortunately we cannot provide alterations, but we offer a wide range of dresses to suit most body shapes and heights."),
  Item(headerValue: "How do you clean your garments?", expandedValue: "A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear."),
  Item(headerValue: "Can I cancel/exhange my order?", expandedValue: "You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee)"),
  Item(headerValue: "Can I cancel/exhange my order?", expandedValue: "You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee)"),
  Item(headerValue: "Can I cancel/exhange my order?", expandedValue: "You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee)"),
  Item(headerValue: "Can I cancel/exhange my order?", expandedValue: "You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee)"),
];

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class FaqExpansionList extends StatefulWidget {
  const FaqExpansionList({super.key});

  @override
  State<FaqExpansionList> createState() =>
      _FaqExpansionListState();
}

class _FaqExpansionListState extends State<FaqExpansionList> {
  final List<Item> _data = faqs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    // return const Column(children: [
    //   SizedBox(height:500),
    //   SizedBox(height:600),
    //   Text('fdesfsd'),
    //   SizedBox(height:600)
    // ],);
    return ExpansionPanelList(
      // materialGapSize: 40,
      expandedHeaderPadding: const EdgeInsets.all(1),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.white,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: StyledHeading(item.headerValue, weight: FontWeight.bold),
            );
          },
          body: ListTile(
              dense: true,
              title: StyledBody(item.expandedValue, weight: FontWeight.normal),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
