import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledBody extends StatelessWidget {
  const StyledBody(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.bodyMedium,
      color: Colors.black, 
    ));
  }
}

class StyledBodyStrikeout extends StatelessWidget {
  const StyledBodyStrikeout(this.text, {super.key});

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
    return Text(text, style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.headlineMedium
    ));
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.titleMedium
    ));
  }
}

class StyledBodyPlayFair extends StatelessWidget {
  const StyledBodyPlayFair(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.playfair(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    ));
  }
}

class StyledHeadingPlayFair extends StatelessWidget {
  const StyledHeadingPlayFair(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.playfair(
      textStyle: Theme.of(context).textTheme.headlineMedium
    ));
  }
}

class StyledTitlePlayFair extends StatelessWidget {
  const StyledTitlePlayFair(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.playfair(
      textStyle: Theme.of(context).textTheme.titleLarge
    ));
  }
}