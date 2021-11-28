import 'package:flutter/material.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }

}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> languages = [
      {'code': 'en', 'title': AppLocalizations.of(context)!.english},
      {'code': 'fr', 'title': AppLocalizations.of(context)!.french},
    ];

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return PageBody(
            title: AppLocalizations.of(context)!.settings,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                        FontAwesome5.moon
                    ),
                    title: InkWell(
                      child: Text(
                          AppLocalizations.of(context)!.darkMode
                      ),
                      onTap: () {
                        context.read<SettingsCubit>().setDarkMode(! state.isDarkMode);
                      },
                    ),
                    trailing: Switch(
                        value: state.isDarkMode,
                        onChanged: (val) {
                          context.read<SettingsCubit>().setDarkMode(! state.isDarkMode);
                        }
                    ),
                  ),
                  Divider(height: 5, color: Colors.grey,),
                  ListTile(
                    leading: Icon(
                        FontAwesome5.language
                    ),
                    title: Text(
                        AppLocalizations.of(context)!.language
                    ),
                    trailing: DropdownButton<String>(
                        items: List.generate(
                            languages.length,
                                (index) => DropdownMenuItem(
                              child: Text(languages[index]['title'].toString()),
                              value: languages[index]['code'],
                            )
                        ),
                        value: state.language,
                        onChanged: (lang) {
                          context.read<SettingsCubit>().setLanguage(lang.toString());
                        }
                    ),
                  )
                ],
              ),
            )
        );
      }
    );
  }

}