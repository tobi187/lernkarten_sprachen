import 'dart:convert';

import 'package:lern_karten/src/models/lang_card_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataHandler {
  Future<List<LanguageCard>> getData(String languageCodes, String first) async {
    String strData = await rootBundle.loadString("data.json");
    var data = await jsonDecode(strData);

    List langs = data["languages"];
    List sentences =
        langs.firstWhere((element) => element[languageCodes])["sentences"];

    if (first == "de") {
      return sentences
          .map((e) =>
              LanguageCard(id: e["id"], lang1: e["ger"], lang2: e["ned"]))
          .toList();
    } else {
      return sentences
          .map((e) =>
              LanguageCard(id: e["id"], lang1: e["ned"], lang2: e["ger"]))
          .toList();
    }
  }
}
