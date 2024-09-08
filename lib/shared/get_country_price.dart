import 'dart:developer';

double sgdthb = 25.76;
List convertedCurrencyList = [];

List convertFromTHB (int value, String currency) {

  double convertedCurrency = 0;
  int roundedFinalValue = 0;
  String symbol;


  switch (currency) {
    case 'SGD':
      convertedCurrency = (value / sgdthb);
      // roundedFinalValue = (convertedCurrency ~/ 5) * 5;
      roundedFinalValue = (convertedCurrency / 5).ceil() * 5;
      symbol = '\$';
      convertedCurrencyList.add(roundedFinalValue);
      convertedCurrencyList.add(symbol);
      break;
  }
  log('Given value was ${value.toString()}');
  log('Rounded return value: ${roundedFinalValue.toString()}');
  return convertedCurrencyList;
}