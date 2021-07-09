import 'dart:convert';

import 'package:http/http.dart' as http;

//'https://rest.coinapi.io/v1/exchangerate/BTC/NPR?apikey=CAE21D85-CBE8-467A-8D67-F0F651845196'

class ApiData {
  ApiData(this.url);
  String url;
  Future getCurrency() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else
      print(response.statusCode);
    throw 'Problem With the get request';
  }
}
