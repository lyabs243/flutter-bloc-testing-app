import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/presentation/components/edit_text.dart';
import 'package:flutter_structure/presentation/screens/home/components/app_button.dart';
import 'package:flutter_structure/presentation/screens/home/components/weather_error_widget.dart';
import 'package:flutter_structure/presentation/screens/home/components/weather_widget.dart';
import '../../languages/localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  bool isLoadingWeather = false, isLoadingGame = false, isWeatherError = true;
  TextEditingController numberEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Center(
        child: Text(MyLocalizations.instanceLocalization['app_title']),
      ),
      actions: [
        IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            )
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          color: Color(0xFFE7EFF6),
          height: MediaQuery.of(context).size.height - appBar.preferredSize.height - 24,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    child: Container(
                      child: RatingBar(
                        initialRating: 4,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
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
                    visible: !isLoadingGame,
                  ),
                  Text(
                    '10:06:34',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Expanded(
                //height: MediaQuery.of(context).size.height * 0.6,
                //width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (isLoadingWeather)?
                    Center(
                      child: CircularProgressIndicator(),
                    ):
                    (
                      (isWeatherError)?
                      WeatherErrorWidget(
                        () {

                        }
                      ):
                      WeatherWidget()
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                    (isLoadingGame)?
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Transform.scale(
                          child: CircularProgressIndicator(),
                          scale: 2,
                        ),
                      )
                    ):
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor
                            ),
                            child: Center(
                              child: Text(
                                '?',
                                textScaleFactor: 5,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            MyLocalizations.instanceLocalization['what_is_hidden_number'],
                            textScaleFactor: 2,
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
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Visibility(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ButtonApp(
                    MyLocalizations.instanceLocalization['ok'],
                    () {

                    }
                  ),
                ),
                visible: !isLoadingGame,
              )
            ],
          ),
        ),
      ),
    );
  }

}