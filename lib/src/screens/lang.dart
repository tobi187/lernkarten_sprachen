import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lern_karten/src/models/lang_card_model.dart';
import 'package:lern_karten/src/services/dataHandler.dart';

class LangFlipper extends StatefulWidget {
  const LangFlipper(
      {Key? key,
      required this.langCodes,
      required this.firstLang,
      required this.isRandom})
      : super(key: key);
  final String langCodes;
  final String firstLang;
  final bool isRandom;

  static const String routeName = "LangFlipper";

  @override
  _LangFlipperState createState() => _LangFlipperState();
}

class _LangFlipperState extends State<LangFlipper> {
  List<LanguageCard> sentences = [];
  String currSentence = "";
  int counter = 0;

  Future<void> loadData() async {
    List<LanguageCard> sentences =
        await DataHandler().getData(widget.langCodes, widget.firstLang);
    currSentence = sentences[counter].lang1;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              if (currSentence == sentences[counter].lang1) {
                currSentence = sentences[counter].lang2;
              } else {
                counter++;
                currSentence = sentences[counter].lang1;
              }
              setState(() {});
            },
            child: Card(
              child: AutoSizeText(
                currSentence,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
