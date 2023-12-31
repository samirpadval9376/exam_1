import 'package:exam_1/controllers/helpers/quotes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController {
  List data = [];
  List<String> category = [
    "happiness",
    "life",
    "cool",
    "success",
    "inspirational",
  ];

  List background = [
    "http://3.bp.blogspot.com/-XZauq1eTP-A/VCLUowF7ZVI/AAAAAAAABl8/FWkzpBOcW9s/s1600/plain-wallpaper-blue-703296.jpg",
    "https://wallpaperaccess.com/full/2089151.jpg",
    "http://avante.biz/wp-content/uploads/Plain-Wallpapers/Plain-Wallpapers-031.jpg",
    "https://tse1.mm.bing.net/th?id=OIP.j7Q4gUeuiKrck2Lwr7fQuAHaEs&pid=Api&P=0&h=180",
    "https://styledme.com/wp-content/uploads/2021/03/plain-background-white-color-wall-minimalist-microsoft-teams-video-calls-backgrounds.jpg",
    "http://wallpapercave.com/wp/21oiI0F.jpg",
  ];

  int bdImage = 0;
  int ind = 0;

  List colors = [
    Colors.white,
    Colors.black,
    ...Colors.primaries,
  ];

  Color? textColor;

  changeColor({required int index}) {
    textColor = colors[index];
    update();
  }

  changeBackground({required int index}) {
    bdImage = index;
    update();
  }

  changeQuote({required int index}) {
    ind = index;
    update();
  }

  back({required int index}) {
    if (bdImage != 0) {
      bdImage--;
    } else {
      bdImage = 0;
    }
    update();
  }

  forward({required int index}) {
    if (bdImage < background.length - 1) {
      bdImage++;
    } else {
      bdImage = 0;
    }
    update();
  }

  backQuote({required int index}) {
    if (ind != 0) {
      ind--;
    } else {
      ind = 0;
    }
    update();
  }

  int fontWeight = 3;

  QuotesController() {
    search();
  }

  font({required int val}) {
    fontWeight = val;
  }

  search({String val = "happiness"}) async {
    data = await QuotesHelper.quotesHelper.quotes(category: val) ?? [];
    update();

    return 0;
  }
}
