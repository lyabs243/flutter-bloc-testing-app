import 'package:flutter/material.dart';
import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationPage extends StatelessWidget {

  final String message;

  const NotificationPage({Key? key, required this.message}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return PageBody(
            title: AppLocalizations.of(context)!.notification,
            child: Column(
              children: [
                Text(message),
              ],
            )
        );
      }
    );
  }

}