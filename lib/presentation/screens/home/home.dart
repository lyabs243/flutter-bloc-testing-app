import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/constants/constants.dart';
import 'package:flutter_structure/constants/enums.dart';
import 'package:flutter_structure/logic/cubits/game_cubit.dart';
import 'package:flutter_structure/logic/cubits/time_cubit.dart';
import 'package:flutter_structure/logic/cubits/weather_cubit.dart';
import 'package:flutter_structure/logic/states/game_state.dart';
import 'package:flutter_structure/logic/states/time_state.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:flutter_structure/presentation/components/edit_text.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';
import 'package:flutter_structure/presentation/screens/home/components/app_button.dart';
import 'package:flutter_structure/presentation/screens/home/components/game_circle_widget.dart';
import 'package:flutter_structure/presentation/screens/home/components/game_status_message.dart';
import 'package:flutter_structure/presentation/screens/home/components/game_loading.dart';
import 'package:flutter_structure/presentation/screens/home/components/weather_error_widget.dart';
import 'package:flutter_structure/presentation/screens/home/components/weather_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  TextEditingController numberEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(context),
        ),
      ],
      child: PageBody(
        title: AppLocalizations.of(context)!.appTitle('lyabs243'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(PAGE_SETTINGS);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              )
          )
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    return Visibility(
                      child: Container(
                        child: RatingBar(
                          initialRating: state.lives.toDouble(),
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          ignoreGestures: true,
                          itemCount: TOTAL_LIVES,
                          ratingWidget: RatingWidget(
                            full: Transform.scale(
                              scale: 0.7,
                              child: Icon(FontAwesome.heart, color: Colors.red,),
                            ),
                            half: Icon(FontAwesome.heartbeat, color: Colors.red,),
                            empty: Transform.scale(
                              scale: 0.7,
                              child: Icon(FontAwesome.heart, color: Colors.grey,),
                            ),
                          ),
                          onRatingUpdate: (rating) {

                          },
                        ),
                      ),
                      visible: ! (state.gameStatus == GameStatus.loading),
                    );
                  }
                ),
                BlocBuilder<TimeCubit, TimeState>(
                    builder: (context, state) {
                      return Text(
                        DateFormat(AppLocalizations.of(context)!.time_format).format(state.dateTime),
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      );
                    }
                )
              ],
            ),
            Expanded(
              //height: MediaQuery.of(context).size.height * 0.6,
              //width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {

                        if (state.customState == CustomState.loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if (state.customState == CustomState.error) {
                          return WeatherErrorWidget(
                                  () {
                                context.read<WeatherCubit>().getWeather();
                              }
                          );
                        }

                        return WeatherWidget(state.weatherItem);

                      }
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                  BlocBuilder<GameCubit, GameState>(
                    builder: (context, state) {

                      if (state.gameStatus == GameStatus.loading) {
                        return GameLoading();
                      }

                      return Container(
                        child: Column(
                          children: [
                            GameCircleWidget(
                              (! (context.read<GameCubit>().state.gameStatus == GameStatus.success || context.read<GameCubit>().state.gameStatus == GameStatus.failed))?
                              '?':
                              '${context.read<GameCubit>().state.hiddenNumber}'
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: LayoutBuilder(
                                builder: (context, constraints) {

                                  if (state.gameStatus == GameStatus.failed || state.gameStatus == GameStatus.success) {

                                    String message = AppLocalizations.of(context)!.congratulations;
                                    IconData iconData = FontAwesome5.hand_peace;
                                    if (state.gameStatus == GameStatus.failed) {
                                      message = AppLocalizations.of(context)!.gameOver;
                                      iconData = FontAwesome5.sad_cry;
                                    }

                                    return GameStatusMessage(iconData, message, textColor: Theme.of(context).primaryColor,);
                                  }
                                  else if (state.gameStatus == GameStatus.greater || state.gameStatus == GameStatus.smaller) {

                                    IconData iconData = FontAwesome.up_circled;
                                    String message = AppLocalizations.of(context)!.greater;

                                    if (state.gameStatus == GameStatus.smaller) {
                                      iconData = FontAwesome.down_circled;
                                      message = AppLocalizations.of(context)!.smaller;
                                    }

                                    return GameStatusMessage(iconData, message);
                                  }

                                  return Text(
                                    AppLocalizations.of(context)!.whatIsHiddenNumber,
                                    textScaleFactor: 2,
                                    textAlign: TextAlign.center,
                                  );
                                }
                              ),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: EditText(
                                  '',
                                  controller: numberEditingController,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w300),
                                  contentPadding: EdgeInsets.all(5),
                                  inputType: TextInputType.number,
                                  showCursor: true,
                                  textAlign: TextAlign.center
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return Visibility(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ButtonApp(
                        (! (state.gameStatus == GameStatus.success || state.gameStatus == GameStatus.failed))?
                        AppLocalizations.of(context)!.ok:
                        AppLocalizations.of(context)!.replay,
                            () {
                          if (! (state.gameStatus == GameStatus.success || state.gameStatus == GameStatus.failed)) {
                            context.read<GameCubit>().checkNumber(numberEditingController.text);
                          }
                          else {
                            numberEditingController.clear();
                            context.read<WeatherCubit>().getWeather();
                            context.read<GameCubit>().initHiddenNumber();
                          }
                        }
                    ),
                  ),
                  visible: ! (state.gameStatus == GameStatus.loading),
                );
              }
            )
          ],
        ),
      ),
    );
  }

}