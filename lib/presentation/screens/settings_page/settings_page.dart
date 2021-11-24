import 'package:flutter/material.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';

import '../../languages/localizations.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }

}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: MyLocalizations.instanceLocalization['settings'],
      child: Container()
    );
  }

}