import 'api.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'CAE21D85-CBE8-467A-8D67-F0F651845196';

class CurrencyModel {
  CurrencyModel(this.countryCurrencyName);
  String countryCurrencyName;
  double rate = 0.0;
  Future getCurrencyData() async {
    ApiData currency = ApiData('$url/BTC/$countryCurrencyName?apikey=$apiKey');

    var getCurrencyDetail = await currency.getCurrency();
    rate = getCurrencyDetail['rate'];
    return rate;
  }
}
