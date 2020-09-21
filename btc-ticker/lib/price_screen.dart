import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

var cryptPrice = {'btc': '0', 'eth': '0', 'ltc': '0'};

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = 'USD';
  CoinData coinData = CoinData();
  // String btcPrice = '0';
  // String ltcPrice = '0';
  // String ethPrice = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
              children: cryptoList.map<TickerWidget>((String crypto) {
            return TickerWidget(
                price: cryptPrice[crypto],
                currentCrypt: crypto,
                currentCurrency: currentCurrency);
          }).toList()),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Center(
              child: DropdownButton(
                value: currentCurrency,
                items: currenciesList
                    .map<DropdownMenuItem<String>>((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (String newCurrency) async {
                  currentCurrency = newCurrency;
                  for (String cryptoName in cryptoList) {
                    cryptPrice[cryptoName] = await coinData.makeGET(
                        currency: currentCurrency, crypto: cryptoName);
                  }
                  setState(
                    () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TickerWidget extends StatelessWidget {
  const TickerWidget({
    Key key,
    @required this.price,
    @required this.currentCurrency,
    @required this.currentCrypt,
  }) : super(key: key);

  final String price;
  final String currentCrypt;
  final String currentCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $currentCrypt = $price $currentCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
