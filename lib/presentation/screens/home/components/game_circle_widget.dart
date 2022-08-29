import 'package:flutter/material.dart';

class GameCircleWidget extends StatelessWidget {

  final String text;

  const GameCircleWidget(this.text, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor
      ),
      child: Center(
        child: Text(
          text,
          textScaleFactor: 5 / text.length,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

}