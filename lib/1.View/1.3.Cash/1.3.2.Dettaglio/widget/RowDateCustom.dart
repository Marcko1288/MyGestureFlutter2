import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/widget.dart';

Widget RowDateCustom(
    String label, DateTime initialValue, Function(DateTime value) onChange) {
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
          child: DatePickerCustom(
              date: initialValue,
              onDateChanged: (value) {
                onChange(value);
              }),
        )
      ],
    ),
  );
}
