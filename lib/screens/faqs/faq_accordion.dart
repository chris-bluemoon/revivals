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



  Color headerColor = Colors.white;
  Color contentColor = Colors.teal.shade900;

class FaqAccordion extends StatelessWidget //__
{
  // static const headerStyle = TextStyle(
  //     color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  // static const contentStyleHeader = TextStyle(
  //     color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  // static const contentStyle = TextStyle(
  //     color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.bold);
  // static const loremIpsum =
  //     '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  // static const slogan =
  //     'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

  FaqAccordion({super.key});


  final List<Item> faqs = [
  Item(header: StyledHeading("Does Unearthed have a studio?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("Want to try something on? Click on the 'APPOINTMENTS' tab under Contact Us in our header menu to arrange a 45 minute fitting session in our boutique.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Do you deliver?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("Yes, we can arrange delivery for a small fee, usually 100 within the Bangkok area, alternatively you can arrange your own collection, just contact us to arrange.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Do you ship internationally?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("We can ship to most SE Asian countries, please contact us to arrange international shipment.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("How long can I keep my item?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("We rent items for 1, 3 and 5 days, for longer terms, please contact and we will check extended availability.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("I need a dress delivered today!", color: headerColor, weight: FontWeight.bold), content: StyledHeading("For last minute rentals, please contact us on LINE!", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Can I reserve in advance?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("Yes, please use the app once registered or contact us on LINE to book your item.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Do you provide alterations?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("Unfortunately we cannot provide alterations, but we offer a wide range of dresses to suit most content shapes and heights.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("How do you clean your garments?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Can I cancel/exchange my order?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee).", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("I need a dress delivered today!", color: headerColor, weight: FontWeight.bold), content: StyledHeading("For last minute rentals, please contact us on LINE!", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Can I reserve in advance?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("Yes, please use the app once registered or contact us on LINE to book your item.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Do you provide alterations?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("Unfortunately we cannot provide alterations, but we offer a wide range of dresses to suit most content shapes and heights.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("How do you clean your garments?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("How do you clean your garments?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("A lot of care goes into ensuring our dresses fresh and clean. Our expert cleaning fairies use a variety of techniques to ensure that each style is dry cleaned, steamed and pressed, inspected for quality, and packaged with care so that it’s ready for another lucky lady to wear.", color: contentColor, weight: FontWeight.normal)),
  Item(header: StyledHeading("Can I cancel/exchange my order?", color: headerColor, weight: FontWeight.bold), content: StyledHeading("You sure can girl. All cancelations bear an additional charge of x. After, you’ll receive a credit to your RENTADELLA account with the full dress rental with a year expiry.  Dress exchanges will incur an additional fee of x for keeping the dress booked. If the new dress is less than the previous, the remaining credits will go into your RENTADELLA account with a year expiry. If it's more, the surplus will be an additional charge (seperate to the x dress exchange fee).", color: contentColor, weight: FontWeight.normal)),
  // Item(header: const StyledHeader("", content: ""),
];



  @override
  build(context) {
     final List<Item> data = faqs;
     double width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Accordion(
            rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: width * 0.07),
            headerBorderColor: Colors.grey,
            headerBorderColorOpened: Colors.transparent,
            // headerBorderWidth: 1,
            headerBackgroundColor: Colors.teal[900],
            headerBackgroundColorOpened: Colors.teal[900],
            contentBackgroundColor: Colors.white,
            contentBorderColor: Colors.transparent,
            // contentBorderColor: Colors.grey[300],
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: false,
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
            //         const Icon(Icons.text_fields_rounded, color: headerColor, weight: FontWeight.bold),
            //     header: const StyledHaeader(const Text('Simple Text', style: headerStyle),
            //     content: const Text(loremIpsum, style: contentStyle),
            //   ),
            // ],
          ),
    );
  }
}