import 'package:flutter/material.dart';

class GameStatusMessage extends StatelessWidget {

  IconData icon;
  String message;
  Color? textColor;

  GameStatusMessage(this.icon, this.message, {this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(this.icon, color: Theme.of(context).primaryColor, size: 30,),
        SizedBox(width: 5,),
        Text(
          message,
          textScaleFactor: 2,
          style: TextStyle(
              color: textColor
          ),
        )
      ],
    );
  }

}