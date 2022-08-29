import 'package:flutter/material.dart';
import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({Key? key}): super(key: key);

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
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    FontAwesome5.moon
                  ),
                  title: InkWell(
                    child: Text(
                      AppLocalizations.of(context)!.darkMode
                    ),
                    onTap: () {
                      SettingsItem settingsItem = context.read<SettingsCubit>().state.settings;
                      settingsItem.isDarkMode = !settingsItem.isDarkMode;
                      context.read<SettingsCubit>().setSettings(settingsItem);
                    },
                  ),
                  trailing: Switch(
                      value: state.settings.isDarkMode,
                      onChanged: (val) {
                        SettingsItem settingsItem = context.read<SettingsCubit>().state.settings;
                        settingsItem.isDarkMode = !settingsItem.isDarkMode;
                        context.read<SettingsCubit>().setSettings(settingsItem);
                      }
                  ),
                ),
                const Divider(height: 5, color: Colors.grey,),
                ListTile(
                  leading: const Icon(
                    FontAwesome5.language
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.language
                  ),
                  trailing: DropdownButton<String>(
                      items: List.generate(
                          languages.length,
                          (index) => DropdownMenuItem(
                            value: languages[index]['code'],
                            child: Text(languages[index]['title'].toString()),
                          )
                      ),
                      value: state.settings.langCode,
                      onChanged: (lang) {
                        SettingsItem settingsItem = context.read<SettingsCubit>().state.settings;
                        settingsItem.langCode = lang!;
                        context.read<SettingsCubit>().setSettings(settingsItem);
                      }
                  ),
                )
              ],
            )
        );
      }
    );
  }

}