import 'dart:convert';

import 'package:exam_1/modals/quotes_modal.dart';
import 'package:http/http.dart' as http;

class QuotesHelper {
  QuotesHelper._();

  static final QuotesHelper quotesHelper = QuotesHelper._();

  quotes({String category = "happiness"}) async {
    String quotes =
        "https://api.api-ninjas.com/v1/quotes?limit=10&category=$category";

    http.Response response = await http.get(
      Uri.parse(quotes),
      headers: {'X-Api-Key': 'fLulbS/eIS1ACumkrbObjA==IGiJ3yTRnpnvAjIW'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // List allData = data['quotes'];

      print("=============================");
      print("${response.body}");
      print("=============================");

      return data;
    } else {
      print(
        "Error:- ${response.statusCode}",
      );
    }
  }
}
