import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/widget.dart';

Widget RowTextFieldCustom(
    String label, String initialValue, Function(String value) onChange,
    {bool enable = true}) {
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
            onChange: (value) {
              onChange(value);
            },
          ),
        )
      ],
    ),
  );
}
