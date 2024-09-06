import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/widget.dart';

Widget RowTextFieldCustom({
  required String label,
  required String initialValue,
  bool enable = true,
  keyboardType = TextInputType.none,
  inputFormatters = null,
  required Function(String value) onChange,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 3),
          width: 90,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(width: 10), // Space between label and input
        Expanded(
          child: TextFieldInput(
            text: initialValue,
            enable: enable,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChange: (value) {
              onChange(value);
            },
          ),
        )
      ],
    ),
  );
}
