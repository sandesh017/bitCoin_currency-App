import 'dart:convert';

import 'package:http/http.dart' as http;

// 'BTC/NPR?apikey='

class ApiData {
  ApiData(this.url);
  String url;
  void getCurrency() async {
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      String value = response.body;
      return jsonDecode(value);
    }else{
      print(response.statusCode);
    }
  }
}
