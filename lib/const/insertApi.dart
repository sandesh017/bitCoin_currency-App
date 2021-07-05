import 'api.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'CAE21D85-CBE8-467A-8D67-F0F651845196';

class CurrencyModel {
  double rate = 0.0;
  Future getCurrencyData() async {
    ApiData currency = ApiData('$url/BTC/USD?apikey=$apiKey');

    var getCurrencyDetail = await currency.getCurrency();
    rate = getCurrencyDetail['rate'];
    return rate;
  }
}
