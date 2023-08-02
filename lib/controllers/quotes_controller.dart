import 'package:exam_1/controllers/helpers/quotes_helper.dart';
import 'package:flutter/material.dart';

class QuotesController extends ChangeNotifier {
  List data = [];
  List<String> category = [
    "happiness",
    "life",
    "cool",
    "success",
    "inspirational",
  ];

  QuotesController() {
    search();
  }

  search({String val = "happiness"}) async {
    data = await QuotesHelper.quotesHelper.quotes(category: val) ?? [];
    notifyListeners();
    return 0;
  }
}
