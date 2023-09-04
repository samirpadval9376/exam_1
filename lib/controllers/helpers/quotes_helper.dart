import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class QuotesHelper {
  QuotesHelper._();

  static final QuotesHelper quotesHelper = QuotesHelper._();

  quotes({String category = "happiness"}) async {
    String quotes =
        "https://api.api-ninjas.com/v1/quotes?limit=10&category=$category";

    http.Response response = await http.get(
      Uri.parse(quotes),
      headers: {'X-Api-Key': 'Mi5FpzN1viPqAh6DM2nCEw==UdKPt0vaCqARFEbk'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // List allData = data['quotes'];

      log("=============================");
      log(response.body);
      log("=============================");

      return data;
    } else {
      log(
        "Error:- ${response.statusCode}",
      );
    }
  }
}
