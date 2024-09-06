import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';

class TextFieldInput extends StatefulWidget {
  String text;
  IconData? iconName;
  String? ltext;
  bool enable;
  TextInputType keyboardType;
  TextInputFormatter? inputFormatters;

  //void Function(String value) onChange;
  final ValueChanged<String> onChange;
  TextFieldInput(
      {required this.text,
      IconData? iconName,
      String? ltext,
      bool? enable,
      TextInputType? keyboardType,
      TextInputFormatter? inputFormatters,
      required this.onChange})
      : this.iconName = iconName ?? null,
        this.ltext = ltext ?? null,
        this.enable = enable ?? true,
        this.keyboardType = keyboardType ?? TextInputType.none,
        this.inputFormatters = inputFormatters ?? null;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late String text;
  late IconData? iconName;
  late String? ltext;
  late bool enable;
  late void Function(String value) onChange;
  late TextInputType keyboardType;
  late List<TextInputFormatter>? inputFormatters;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    iconName = widget.iconName;
    ltext = widget.ltext;
    enable = widget.enable;
    keyboardType = widget.keyboardType;

    if (widget.inputFormatters == null) {
      inputFormatters = null;
    } else {
      inputFormatters = [widget.inputFormatters!];
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextField(
          enabled: enable,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(iconName),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: text,
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ltext,
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
          //onChanged: (value) => onChange(value),
          onChanged: (value) {
            setState(() {
              widget.onChange(value);
            });
          },
        ),
      ),
    );
  }
}
