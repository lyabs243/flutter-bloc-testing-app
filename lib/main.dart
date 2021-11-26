import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_structure/constants/enums.dart';
import 'package:flutter_structure/logic/cubits/time_cubit.dart';
import 'package:flutter_structure/logic/cubits/weather_cubit.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:flutter_structure/presentation/router/app_router.dart';
import 'presentation/languages/localizations.dart';
import 'presentation/screens/home/home.dart';
import 'constants/constants.dart';
import 'presentation/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String langCode = LANG_CODE;

    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeCubit>(
          create: (context) => TimeCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          MyLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        onGenerateTitle: (BuildContext context) => MyLocalizations.of(context)?.localization['app_title'],
        locale: Locale(langCode),
        supportedLocales: [Locale('en')],
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
      )
    );
  }
}
