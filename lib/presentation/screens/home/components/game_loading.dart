import 'package:flutter/material.dart';

class GameLoading extends StatelessWidget {

  const GameLoading({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Transform.scale(
          scale: 2,
          child: const CircularProgressIndicator(),
        ),
      )
    );
  }

}