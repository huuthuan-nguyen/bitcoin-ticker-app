import 'package:bitcoin_ticker_app/networking.dart';

const apiKey = "";
const coinAPIDomain = "";
const coinAPIPath = "";

const List<String> currenciesList = [
  "AUD",
  "BRL",
  "CAD",
  "CNY",
  "EUR",
  "GBP",
  "HKD",
  "IDR",
  "ILS",
  "INR",
  "JPY",
  "MXN",
  "NOK",
  "NZD",
  "PLN",
  "RON",
  "RUB",
  "SEK",
  "SGD",
  "USD",
  "ZAR",
];

const List<String> cryptoList = [
  "BTC",
  "ETH",
  "LTC",
];

class CoinData {
  Future<dynamic> getCoinData() async {
    Uri uri = Uri.https(coinAPIDomain, coinAPIPath, {
      "appid": apiKey,
    });
    NetworkHelper networkHelper = NetworkHelper(uri: uri);

    var coinData = await networkHelper.getData();

    return coinData;
  }
}
