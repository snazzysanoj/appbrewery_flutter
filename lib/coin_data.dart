import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<String> makeGET({String currency='USD', String crypto='BTC'}) async{
    String url = 'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=BA6255CB-B373-46D7-94D4-695E6B533820';
   var t = await http.get(url);
   return jsonDecode(t.body)['rate'].toString();
  }
}
