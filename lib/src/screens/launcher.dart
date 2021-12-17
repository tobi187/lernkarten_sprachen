import 'package:flutter/material.dart';
import 'package:lern_karten/src/settings/settings_view.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  String firstLang = "Deutsch";

  String secondLang = "Holländisch";

  final test = "";

  final List<DropdownMenuItem<String>> langList = ["Deutsch", "Holländisch"]
      .map((e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sprachen lernen leicht gemacht"),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.center,
              child: DropdownButton(
                  items: langList,
                  onChanged: (String? val) {
                    if (secondLang == val!) {
                      secondLang = firstLang;
                      firstLang = val;
                    } else {
                      firstLang = val;
                    }
                    setState(() {});
                  },
                  value: firstLang),
            ),
            DropdownButton(
                items: langList,
                onChanged: (String? val) {
                  if (firstLang == val!) {
                    firstLang = secondLang;
                    secondLang = val;
                  } else {
                    secondLang = val;
                  }
                  setState(() {});
                },
                value: secondLang),
            ElevatedButton(onPressed: () {}, child: const Text("Starten"))
          ],
        ));
  }
}
