import 'package:flutter/material.dart';
import 'package:unearthed/screens/faqs/faq_accordion.dart';
import 'package:unearthed/shared/styled_text.dart';

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/unearthed_logo_3.png',
              // height: 200,
              height: width * 0.15,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: width*0.06),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: Icon(Icons.close, size: width*0.06)),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {

        return Column(
          children: [
            SizedBox(height: width * 0.02),
            const Center(
              child: StyledTitle("Frequently Asked Questions")),
            SizedBox(height: width * 0.05),
            // const FaqExpansionList()
            FaqAccordion()
            // const FaqExpansionList()
            // const ScrollTest(),
            // const SizedBox(
            //   height: 900,
            //   child: AccordionPage()
            // )
          ],
        );
        }
      )
    );
  }
}