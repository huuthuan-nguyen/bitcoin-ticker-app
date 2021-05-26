import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  const CryptoCard(
      {required this.value,
      required this.selectedCurrency,
      required this.cryptoCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 28,
          ),
          child: Text(
            "1 $cryptoCurrency = $value $selectedCurrency",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
