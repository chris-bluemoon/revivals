import 'dart:io';

import 'package:intl/intl.dart';

class MyGlobalVariables {
  
  static String thb  = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'THB').currencySymbol;
  static String userId = '123';
}

