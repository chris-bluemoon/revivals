import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    ));
  }
}


class StyledTextStrikeout extends StatelessWidget {
  const StyledTextStrikeout(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.bodyMedium,
      decoration: TextDecoration.lineThrough
    ));
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.headlineMedium
    ));
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.titleMedium
    ));
  }
}