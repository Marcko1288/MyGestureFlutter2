import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';

class TextTitle extends StatelessWidget {
  String title;
  Color color;
  double size;

  TextTitle({required this.title, Color? color, double? size})
      : this.color = color ?? titleColor,
        this.size = size ?? 22.77;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
            color: color,
            fontSize: SizeConfig.screenHeight! / 22.77,
            fontWeight: FontWeight.bold),
      ),

      /// 30
      alignment: Alignment.center,
    );
  }
}
