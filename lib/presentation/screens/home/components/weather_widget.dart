import 'package:flutter/material.dart';
import 'package:flutter_structure/data/models/weather_item.dart';

class WeatherWidget extends StatelessWidget {

  WeatherItem? weatherItem;

  WeatherWidget(this.weatherItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      weatherItem!.icon,
                    ),
                    fit: BoxFit.fitHeight
                )
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Container(
            child: Text(
              '${weatherItem!.temperatureCelcius.toStringAsFixed(0)}ºC',
              maxLines: 1,
              textScaleFactor: 3,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            '${weatherItem!.city}',
            maxLines: 2,
            textAlign: TextAlign.center,
            textScaleFactor: 1.5,
          )
        ],
      ),
    );
  }

}