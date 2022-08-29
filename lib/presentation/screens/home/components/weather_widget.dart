import 'package:flutter/material.dart';
import 'package:flutter_structure/data/models/weather_item.dart';

class WeatherWidget extends StatelessWidget {

  final WeatherItem? weatherItem;

  const WeatherWidget(this.weatherItem, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          '${weatherItem!.temperatureCelcius.toStringAsFixed(0)}ºC',
          maxLines: 1,
          textScaleFactor: 3,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          weatherItem!.city,
          maxLines: 2,
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        )
      ],
    );
  }

}