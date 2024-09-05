import 'package:flutter/material.dart';
import 'package:unearthed/screens/faqs/faq_accordion.dart';
import 'package:unearthed/shared/styled_text.dart';

class ScrollTest extends StatelessWidget {
  const ScrollTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          FaqAccordion(),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TEST'),
          const StyledTitle('TaaaEST'),
        ],)
      ),
    );
  }
}