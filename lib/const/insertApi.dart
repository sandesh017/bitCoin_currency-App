import 'api.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'CAE21D85-CBE8-467A-8D67-F0F651845196';

class CurrencyModel {
  void getCurrencyData() {
    ApiData currency = ApiData('$url/BTC/USD?apikey=$apiKey');

    var getCurrencyDetail = currency.getCurrency();
    return getCurrencyDetail;
  }
}
