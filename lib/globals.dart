library globals;

import 'dart:io';

import 'package:intl/intl.dart';


// String globalVar = "Educative";
String thb  = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'THB').currencySymbol;

String confirmedRentMessage = 'Your new rental is being prepared!';
String confirmedRentBody = '';
