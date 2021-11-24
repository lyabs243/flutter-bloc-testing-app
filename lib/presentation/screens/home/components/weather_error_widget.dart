import 'package:flutter/material.dart';
import 'package:flutter_structure/presentation/languages/localizations.dart';

class WeatherErrorWidget extends StatelessWidget {

  Function onTryAgain;

  WeatherErrorWidget(this.onTryAgain);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: FittedBox(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
              fit: BoxFit.contain,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Container(
            child: Text(
              MyLocalizations.instanceLocalization['failed_get_weather'],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          TextButton(
            onPressed: () {
              this.onTryAgain();
            },
            child: Text(
              MyLocalizations.instanceLocalization['try_again'],
              style: TextStyle(
                color: Theme.of(context).primaryColor
              ),
            )
          )
        ],
      ),
    );
  }

}