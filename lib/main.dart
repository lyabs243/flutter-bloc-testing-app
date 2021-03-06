import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_structure/utils/enums.dart';
import 'package:flutter_structure/generated/l10n.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/logic/cubits/time_cubit.dart';
import 'package:flutter_structure/logic/cubits/weather_cubit.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:flutter_structure/presentation/router/app_router.dart';
import 'logic/cubits/game_cubit.dart';
import 'utils/constants.dart';
import 'presentation/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(appRouter: AppRouter(),)),
    storage: storage
  );
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
        BlocProvider<TimeCubit>(
          create: (context) => TimeCubit(),
        ),
        BlocProvider<GameCubit>(
          create: (context) => GameCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle('lyabs243'),
            locale: Locale(state.language),
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: (state.isDarkMode)? darkTheme: lightTheme,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        }
      )
    );
  }
}
