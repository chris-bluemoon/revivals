import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:unearthed/shared/styled_text.dart';



class Item {
  Item({
    required this.content,
    required this.header,
    this.isExpanded = false,
  });

  Widget content;
  Widget header;
  bool isExpanded;
}



class FaqAccordion extends StatelessWidget //__
{
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  static const slogan =
      'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

  FaqAccordion({super.key});

  List<Item> faqs = [
  Item(header: const StyledHeading("Does Unearthed have a studio?", color: Colors.white), content: const StyledHeading("Want to try something on? Click on the 'APPOINTMENTS' tab under Contact Us in our header menu to arrange a 45 minute fitting session in our boutique.", color: Colors.black)),
  Item(header: const StyledHeading("Do you deliver?", color: Colors.white), content: const StyledHeading("Yes, we can arrange delivery for a small fee, usually 100 within the Bangkok area, alternatively you can arrange your own collection, just contact us to arrange.", color: Colors.black)),
  Item(header: const StyledHeading("Do you ship internationally?", color: Colors.white), content: const StyledHeading("We can ship to most SE Asian countries, please contact us to arrange international shipment.", color: Colors.black)),
  Item(header: const StyledHeading("How long can I keep my item?", color: Colors.white), content: const StyledHeading("We rent items for 1, 3 and 5 days, for longer terms, please contact and we will check extended availability.", color: Colors.black)),
  Item(header: const StyledHeading("I need a dress delivered today!", color: Colors.white), content: const StyledHeading("For last minute rentals, please contact us on LINE!", color: Colors.black)),
  Item(header: const StyledHeading("Can I reserve in advance?", color: Colors.white), content: const StyledHeading("Yes, please use the app once registered or contact us on LINE to book your item.", color: Colors.black)),
  Item(header: const StyledHeading("Do you provide alterations?", color: Colors.white), content: const StyledHeading("Unfortunately we cannot provide alterations, but we offer a wide range of dresses to suit most content shapes and heights.", color: Colors.black)),
  Item(header: const StyledHeading("How do you clean your garments?", color: Colors.white), content: const StyledHeading("A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear.", color: Colors.black)),
  Item(header: const StyledHeading("Can I cancel/exchange my order?", color: Colors.white), content: const StyledHeading("You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee).", color: Colors.black)),
  Item(header: const StyledHeading("I need a dress delivered today!", color: Colors.white), content: const StyledHeading("For last minute rentals, please contact us on LINE!", color: Colors.black)),
  Item(header: const StyledHeading("Can I reserve in advance?", color: Colors.white), content: const StyledHeading("Yes, please use the app once registered or contact us on LINE to book your item.", color: Colors.black)),
  Item(header: const StyledHeading("Do you provide alterations?", color: Colors.white), content: const StyledHeading("Unfortunately we cannot provide alterations, but we offer a wide range of dresses to suit most content shapes and heights.", color: Colors.black)),
  Item(header: const StyledHeading("How do you clean your garments?", color: Colors.white), content: const StyledHeading("A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear.", color: Colors.black)),
  Item(header: const StyledHeading("How do you clean your garments?", color: Colors.white), content: const StyledHeading("A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear.", color: Colors.black)),
  Item(header: const StyledHeading("Can I cancel/exchange my order?", color: Colors.white), content: const StyledHeading("You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee).", color: Colors.black)),
  // Item(header: const StyledHeader("", content: ""),
];



  @override
  build(context) {
     final List<Item> data = faqs;
    return Accordion(
          headerBorderColor: Colors.blue,
          headerBorderColorOpened: Colors.transparent,
          // headerBorderWidth: 1,
          headerBackgroundColor: Colors.black,
          headerBackgroundColorOpened: Colors.black,
          contentBackgroundColor: Colors.white,
          contentBorderColor: Colors.black,
          contentBorderWidth: 3,
          contentHorizontalPadding: 20,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: data.map<AccordionSection>((Item item) {
            return AccordionSection(
              header: item.header, 
              content: item.content, 
              contentVerticalPadding: 20,
            );
          }).toList(),
          // children: [
          //   AccordionSection(
          //     isOpen: true,
          //     contentVerticalPadding: 20,
          //     leftIcon:
          //         const Icon(Icons.text_fields_rounded, color: Colors.white),
          //     header: const StyledHaeader(const Text('Simple Text', style: headerStyle),
          //     content: const Text(loremIpsum, style: contentStyle),
          //   ),
          // ],
        );
  }
}