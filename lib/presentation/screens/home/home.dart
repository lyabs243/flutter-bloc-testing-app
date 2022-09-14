import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_structure/logic/cubits/game_cubit.dart';
import 'package:flutter_structure/logic/cubits/time_cubit.dart';
import 'package:flutter_structure/logic/cubits/weather_cubit.dart';
import 'package:flutter_structure/logic/responses/game_response.dart';
import 'package:flutter_structure/logic/states/game_state.dart';
import 'package:flutter_structure/logic/states/time_state.dart';
import 'package:flutter_structure/logic/states/weather_state.dart';
import 'package:flutter_structure/presentation/components/edit_text.dart';
import 'package:flutter_structure/presentation/components/page_body.dart';
import 'package:flutter_structure/presentation/components/response_code_widget.dart';
import 'package:flutter_structure/presentation/screens/home/components/app_button.dart';
import 'package:flutter_structure/presentation/screens/home/components/game_circle_widget.dart';
import 'package:flutter_structure/presentation/screens/home/components/game_loading.dart';
import 'package:flutter_structure/presentation/screens/home/components/game_status_message.dart';
import 'package:flutter_structure/presentation/screens/home/components/weather_error_widget.dart';
import 'package:flutter_structure/presentation/screens/home/components/weather_widget.dart';
import 'package:flutter_structure/utils/my_material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(context),
      child: BlocListener<GameCubit, GameState>(
        listener: listener,
        child: PageBody(
          title: AppLocalizations.of(context)!.appTitle,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(pageSettings);
                },
                icon: const Icon(
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
                          visible: ! state.isLoading,
                          child: RatingBar(
                            direction: Axis.horizontal,
                            ignoreGestures: true,
                            initialRating: state.lives.toDouble(),
                            itemCount: totalLives,
                            allowHalfRating: false,
                            ratingWidget: RatingWidget(
                              full: Transform.scale(
                                scale: 0.7,
                                child: const Icon(FontAwesome.heart, color: Colors.red,),
                              ),
                              half: const Icon(FontAwesome.heartbeat, color: Colors.red,),
                              empty: Transform.scale(
                                scale: 0.7,
                                child: const Icon(FontAwesome.heart, color: Colors.grey,),
                              ),
                            ),
                            onRatingUpdate: (rating) {

                            },
                          ),
                        );
                      }
                  ),
                  BlocBuilder<TimeCubit, TimeState>(
                      builder: (context, state) {
                        return Text(
                          DateFormat(AppLocalizations.of(context)!.timeFormat).format(state.dateTime),
                          textScaleFactor: 1.5,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        );
                      }
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<WeatherCubit, WeatherState>(
                        builder: (context, state) {

                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state.weatherItem == null) {
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

                          if (state.isLoading) {
                            return const GameLoading();
                          }

                          return Column(
                            children: [
                              GameCircleWidget(state.circleText),
                              const SizedBox(height: 10,),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {

                                      if (state.response != null) {
                                        return GameStatusMessage(state.response!.icon, state.response!.message(context));
                                      }

                                      return Text(
                                        AppLocalizations.of(context)!.whatIsHiddenNumber,
                                        textScaleFactor: 2,
                                        textAlign: TextAlign.center,
                                      );
                                    }
                                ),
                              ),
                              const SizedBox(height: 10,),
                              SizedBox(
                                height: 80,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: EditText(
                                    '',
                                    onSubmitted: (text) => context.read<GameCubit>().checkNumber(),
                                    controller: state.numberEditingController,
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w300
                                    ),
                                    contentPadding: const EdgeInsets.all(5),
                                    inputType: TextInputType.number,
                                    showCursor: true,
                                    textAlign: TextAlign.center
                                ),
                              )
                            ],
                          );
                        }
                    ),
                    BlocBuilder<GameCubit, GameState>(
                        builder: (context, state) {
                          return Visibility(
                            visible: ! state.isLoading,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ButtonApp(
                                  state.buttonText(context),
                                      () {
                                    if (! (state.response?.code == GameResponseCode.success ||
                                        state.response?.code == GameResponseCode.failed)) {
                                      context.read<GameCubit>().checkNumber();
                                    }
                                    else {
                                      context.read<WeatherCubit>().getWeather();
                                      context.read<GameCubit>().initHiddenNumber();
                                    }
                                  }
                              ),
                            ),
                          );
                        }
                    )
                  ],
                ),
              ),
              Container(height: 5,),
            ],
          ),
        ),
      ),
    );
  }

  listener(BuildContext context, GameState state) {

    if (state.response != null) {

      if (state.response?.code == GameResponseCode.success || state.response?.code == GameResponseCode.failed) {
        ResponseCodeWidget(context: context, item: state.response!).show();
      }

      state.response = null;

    }

  }

}