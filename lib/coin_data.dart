import 'package:bitcoin_ticker_app/networking.dart';

const apiKey = "AACBF7DF-5209-4B66-AAA9-003AE0D8124D";
const coinAPIDomain = "rest.coinapi.io";
const coinAPIPath = "/v1/exchangerate/";

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
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      Uri uri = Uri.https(
          coinAPIDomain, coinAPIPath + crypto + "/" + selectedCurrency, {
        "apikey": apiKey,
      });
      NetworkHelper networkHelper = NetworkHelper(uri: uri);

      var coinData = await networkHelper.getData();

      double lastRice = coinData["rate"];
      cryptoPrices[crypto] = lastRice.toStringAsFixed(0);
    }

    return cryptoPrices;
  }
}
