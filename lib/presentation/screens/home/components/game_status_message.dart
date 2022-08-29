import 'package:flutter/material.dart';

class GameStatusMessage extends StatelessWidget {

  final IconData icon;
  final String message;
  final Color? textColor;

  const GameStatusMessage(this.icon, this.message, {this.textColor, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 30,),
        const SizedBox(width: 5,),
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