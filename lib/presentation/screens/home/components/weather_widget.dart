import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'http://openweathermap.org/img/wn/09d.png',
                    ),
                    fit: BoxFit.fitHeight
                )
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Container(
            child: Text(
              '10ºC',
              maxLines: 1,
              textScaleFactor: 3,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            'LUBUMBASHI',
            maxLines: 2,
            textAlign: TextAlign.center,
            textScaleFactor: 1.5,
          )
        ],
      ),
    );
  }

}