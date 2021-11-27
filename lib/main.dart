import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_structure/constants/enums.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/logic/cubits/time_cubit.dart';
import 'package:flutter_structure/logic/cubits/weather_cubit.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:flutter_structure/presentation/router/app_router.dart';
import 'logic/cubits/game_cubit.dart';
import 'presentation/languages/localizations.dart';
import 'constants/constants.dart';
import 'presentation/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

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
            localizationsDelegates: [
              MyLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            onGenerateTitle: (BuildContext context) => MyLocalizations.of(context)?.localization['app_title'],
            locale: Locale(state.language),
            supportedLocales: languages.toList().map((code) => Locale(code)),
            debugShowCheckedModeBanner: false,
            theme: (state.isDarkMode)? darkTheme: lightTheme,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        }
      )
    );
  }
}
