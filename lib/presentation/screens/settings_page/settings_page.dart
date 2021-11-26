import 'package:flutter/material.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import '../../languages/localizations.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }

}

class _SettingsPageState extends State<SettingsPage> {

  bool isDarkMode = false;
  String selectedLangCode = 'en';

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> languages = [
      {'code': 'en', 'title': MyLocalizations.instanceLocalization['english'].toString()},
      {'code': 'fr', 'title': MyLocalizations.instanceLocalization['french'].toString()},
    ];

    return PageBody(
      title: MyLocalizations.instanceLocalization['settings'],
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                  FontAwesome5.moon
              ),
              title: InkWell(
                child: Text(
                  MyLocalizations.instanceLocalization['dark_mode']
                ),
                onTap: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
              ),
              trailing: Switch(
                  value: isDarkMode,
                  onChanged: (val) {
                    setState(() {
                      isDarkMode = val;
                    });
                  }
              ),
            ),
            Divider(height: 5, color: Colors.grey,),
            ListTile(
              leading: Icon(
                FontAwesome5.language
              ),
              title: Text(
                MyLocalizations.instanceLocalization['language']
              ),
              trailing: DropdownButton<String>(
                items: List.generate(
                  languages.length,
                  (index) => DropdownMenuItem(
                    child: Text(languages[index]['title'].toString()),
                    value: languages[index]['code'],
                  )
                ),
                value: selectedLangCode,
                onChanged: (lang) {
                  setState(() {
                    selectedLangCode = lang.toString();
                  });
                }
              ),
            )
          ],
        ),
      )
    );
  }

}