import '../coin_data.dart';
import 'api.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '9DE46A84-3282-400B-B719-DCBC5E2F7313';

class CurrencyModel {
  // CurrencyModel(this.countryCurrencyName);
  // String countryCurrencyName;
  // double rate = 0.0;
  Future getCurrencyData(String countryCurrencyName) async {
    Map<String, String> bitCoinList = {};
    for (String crptBitcoinList in cryptoList) {
      ApiData currency =
          ApiData('$url/$crptBitcoinList/$countryCurrencyName?apikey=$apiKey');
      var getCurrencyDetail = await currency.getCurrency();
      double rate = getCurrencyDetail['rate'];
      bitCoinList[crptBitcoinList] = rate.toStringAsFixed(2);
    }
    
    return bitCoinList;
  }
}
