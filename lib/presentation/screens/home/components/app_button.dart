import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String text;

  final Function onPressed;
  final FontWeight? textFontWeight;
  final double padding, borderRadius, height;

  const ButtonApp(this.text, this.onPressed,
      {Key? key, this.padding = 0.0,
      this.borderRadius = 15,
      this.textFontWeight,
      this.height = 50}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(40),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: textFontWeight ?? FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ),
      ),
    );
  }
}
