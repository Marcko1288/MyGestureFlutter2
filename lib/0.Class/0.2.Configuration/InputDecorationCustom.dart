import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';

InputDecoration inputDecorator(
    {required Color borderColor,
    required Color textColor,
    Widget? iconPre = null,
    Widget? iconPost = null,
    String? text = null,
    String? ltext = null}) {
  return InputDecoration(
    prefixIcon: iconPre,
    suffixIcon: iconPost,
    focusedBorder: focusedBorder_outlineInputBorder(borderColor),
    border: border_outlineInputBorder(borderColor),
    disabledBorder: disabledBorder_outlineInputBorder(borderColor),
    hintText: text,
    hintStyle:
        TextStyle(color: textColor.withOpacity(0.3)), // Colore del suggerimento
    labelText: ltext,
    labelStyle:
        TextStyle(color: textColor.withOpacity(0.6)), // Colore della label
  );
}

OutlineInputBorder focusedBorder_outlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      width: SizeConfig.screenWidth! / 205.5,
      color: borderColor, // Colore del bordo
    ),
  );
}

OutlineInputBorder border_outlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      width: 1.0, // Assicurati che la larghezza del bordo sia uniforme
      color: borderColor,
    ),
  );
}

OutlineInputBorder disabledBorder_outlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      width: 1.0, // Assicurati che la larghezza del bordo sia uniforme
      color: borderColor,
    ),
  );
}
