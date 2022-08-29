import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherErrorWidget extends StatelessWidget {

  final Function onTryAgain;

  const WeatherErrorWidget(this.onTryAgain, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              color: Colors.red,
              Icons.error,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            AppLocalizations.of(context)!.failedGetWeather,
          ),
        ),
        TextButton(
            onPressed: () {
              onTryAgain();
            },
            child: Text(
              AppLocalizations.of(context)!.tryAgain,
              style: TextStyle(
                  color: Theme.of(context).primaryColor
              ),
            )
        )
      ],
    );
  }

}