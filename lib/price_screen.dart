import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';
import 'const/insertApi.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  @override
  void initState() {
    super.initState();
    getData();
    // cryptoCurerncyList();
  }

  Map<String, String> bitconPrice = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CurrencyModel().getCurrencyData(selectedCurrency);
      isWaiting = false;
      setState(() {
        bitconPrice = data;
      });
    } catch (e) {
      print(e);
    }
  }

// Map<String, String> listMap = {};
//   void cryptoCurerncyList() {
//     for (String list in cryptoList) {
//       listMap[list] = lastPri
//     }
//   }

  //FOR ANdriod
  DropdownButton<String> andriodButton() {
    List<DropdownMenuItem<String>> dropDownList = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropDownList.add(newItem);
    }
    return DropdownButton<String>(
      hint: Text(selectedCurrency),
      items: dropDownList,
      onChanged: (String? value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

//FOR IOS
  CupertinoPicker iOSbutton() {
    List<Text> pickerList = [];
    for (String currency in currenciesList) {
      pickerList.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedValue) {},
      children: pickerList,
    );
  }

  String selectedCurrency = 'USD';
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonPadding(
                  listedBitcoin: 'BTC',
                  bitconPrice: isWaiting ?'?' : bitconPrice['ETH'],
                  selectedCurrency: selectedCurrency),
              CommonPadding(
                  listedBitcoin: 'ETH',
                  bitconPrice: isWaiting ?'?' : bitconPrice['ETH'],
                  selectedCurrency: selectedCurrency),
              CommonPadding(
                  listedBitcoin: 'LTC',
                  bitconPrice: isWaiting ?'?' : bitconPrice['LTC'],
                  selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSbutton() : andriodButton(),
          ),
        ],
      ),
    );
  }
}

class CommonPadding extends StatelessWidget {
  const CommonPadding(
      {Key? key,
      required this.bitconPrice,
      required this.selectedCurrency,
      required this.listedBitcoin})
      : super(key: key);

  final String bitconPrice;
  final String selectedCurrency;
  final String listedBitcoin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
      child: Card(
        color: Colors.red,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $listedBitcoin  =  $bitconPrice $selectedCurrency',
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
