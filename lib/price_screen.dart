import 'package:bitcoin_ticker_app/coin_data.dart';
import 'package:bitcoin_ticker_app/crypto_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  String selectedCurrency = "USD";
  Map<String, String> coinValues = {};
  bool isWaiting = false;
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value ?? "USD";
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getData();
      },
      children: dropdownItems,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else {
      return androidDropdown();
    }
  }

  void getData() async {
    setState(() {
      isWaiting = true;
    });
    Map<String, String> data = await CoinData().getCoinData(selectedCurrency);
    try {
      setState(() {
        isWaiting = false;
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🤑 Coin Ticker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoCard(
                value: (isWaiting ? "?" : coinValues["BTC"]) ?? "?",
                selectedCurrency: selectedCurrency,
                cryptoCurrency: "BTC",
              ),
              CryptoCard(
                value: (isWaiting ? "?" : coinValues["ETH"]) ?? "?",
                selectedCurrency: selectedCurrency,
                cryptoCurrency: "ETH",
              ),
              CryptoCard(
                value: (isWaiting ? "?" : coinValues["LTC"]) ?? "?",
                selectedCurrency: selectedCurrency,
                cryptoCurrency: "LTC",
              ),
            ],
          ),
          Container(
            child: getPicker(),
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
