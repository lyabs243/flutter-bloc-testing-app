import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/languages/localizations.dart';
import 'presentation/screens/home/home.dart';
import 'constants/constants.dart';
import 'presentation/styles/styles.dart';

void main() {
  String langCode = LANG_CODE;

  runApp(MaterialApp(
    localizationsDelegates: [
      MyLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    onGenerateTitle: (BuildContext context) =>
    MyLocalizations.of(context)?.localization['app_title'],
    locale: Locale(langCode),
    supportedLocales: [Locale('en')],
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {

  String langCode = LANG_CODE;

  @override
  void initState() {
    super.initState();
  }

  Future initApp() async {

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: initApp(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
