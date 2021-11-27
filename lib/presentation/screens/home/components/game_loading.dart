import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Transform.scale(
          child: CircularProgressIndicator(),
          scale: 2,
        ),
      )
    );
  }

}