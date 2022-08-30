import 'package:flutter/material.dart';

class EditText extends StatelessWidget {

  final String hintText;
  final bool isPassword, showCursor, enabled;
  final TextStyle? hintStyle, labelStyle, style;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Function? onTextChange;
  final void Function(String text)? onSubmitted;
  final Widget? prefixIcon, suffixIcon;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final FocusNode? focusNode;

  const EditText(this.hintText, {Key? key, this.isPassword = false, this.hintStyle, this.labelStyle, this.contentPadding , this.labelText, this.controller,
    this.inputType = TextInputType.text, this.onTextChange, this.prefixIcon, this.suffixIcon, this.color, this.textAlign = TextAlign.start,
    this.style, this.showCursor = true, this.enabled = true, this.maxLines = 1, this.focusNode,
    this.onSubmitted}) :
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
          cursorColor: const Color(0XFF003049),
          cursorHeight: 20,
          style: style,
          onChanged: (value) {
            if (onTextChange != null) {
              onTextChange!(value);
            }
          },
          onFieldSubmitted: onSubmitted,
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
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        )
    );
  }

}