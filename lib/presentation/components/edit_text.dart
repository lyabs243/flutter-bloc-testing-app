import 'package:flutter/material.dart';

class EditText extends StatelessWidget {

  String hintText;
  bool isPassword, showCursor, enabled;
  TextStyle? hintStyle, labelStyle, style;
  EdgeInsetsGeometry? contentPadding;
  String? labelText;
  TextEditingController? controller;
  TextInputType inputType;
  Function? onTextChange;
  Widget? prefixIcon, suffixIcon;
  Color? color;
  TextAlign textAlign;
  int maxLines;
  FocusNode? focusNode;

  EditText(this.hintText, {this.isPassword = false, this.hintStyle, this.labelStyle, this.contentPadding , this.labelText, this.controller,
    this.inputType: TextInputType.text, this.onTextChange, this.prefixIcon, this.suffixIcon, this.color, this.textAlign = TextAlign.start,
    this.style, this.showCursor: true, this.enabled: true, this.maxLines: 1, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextFormField(

          obscureText: isPassword,
          controller: controller,
          keyboardType: inputType,
          focusNode: focusNode,
          textAlign: textAlign,
          maxLines: maxLines,
          minLines: 1,
          enabled: enabled,
          showCursor: showCursor,
          cursorColor: Color(0XFF003049),
          cursorHeight: 20,
          style: style,
          onChanged: (value) {
            if (onTextChange != null) {
              onTextChange!(value);
            }
          },
          decoration: InputDecoration(
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: hintStyle,
            fillColor: Colors.grey[400],
            filled: true,
            labelText: labelText,
            labelStyle: labelStyle,
            prefixIcon: (prefixIcon != null) ? prefixIcon : null,
            suffixIcon: (suffixIcon != null) ? suffixIcon : null,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        )
    );
  }

}