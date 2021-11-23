import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String text;

  final Function onPressed;
  final FontWeight? textFontWeight;
  final double padding, borderRadius, height;

  ButtonApp(this.text, this.onPressed,
      {this.padding: 0.0,
      this.borderRadius: 15,
      this.textFontWeight,
      this.height: 50});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: () {
            this.onPressed();
          },
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: textFontWeight ?? FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
