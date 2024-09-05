import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';

Widget RowTextCustom(
    String label, String initialValue, Function(String value) onChange,
    {bool enable = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 6),
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
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! / 20.55,
                  SizeConfig.screenHeight! / 68.3,
                  SizeConfig.screenWidth! / 20.55,
                  SizeConfig.screenHeight! / 34.15),
              child: TextField(
                enabled: false,
                style: TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: InputDecoration(
                    prefixIcon: Icon(null),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          width: SizeConfig.screenWidth! / 205.5,
                          color: textColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Totale',
                    hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
                    labelText: initialValue,
                    labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
