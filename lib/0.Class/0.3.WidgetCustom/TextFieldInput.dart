import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';

class TextFieldInput extends StatefulWidget {
  String text;
  IconData? iconName;
  String? ltext;
  bool enable;
  TextInputType keyboardType;
  TextInputFormatter? inputFormatters;

  void Function(String value) onChange;
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
    refresh();
  }

  @override
  void didUpdateWidget(covariant TextFieldInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Se il widget è disabilitato, usa un colore grigio chiaro per i bordi e il testo
    Color borderColor = widget.enable ? Colors.grey : Colors.grey.shade400;
    Color textColor = widget.enable ? Colors.black : Colors.grey.shade400;

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
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor), // Colore del testo
          cursorColor: textColor, // Colore del cursore
          decoration: inputDecorator(
              borderColor: borderColor,
              textColor: textColor,
              iconPre: Icon(iconName, color: textColor),
              iconPost: Icon(iconName, color: textColor),
              text: text,
              ltext: ltext),
          onChanged: (value) {
            setState(() {
              widget.onChange(value);
            });
          },
        ),
      ),
    );
  }

  void refresh() {
    text = widget.text;
    iconName = widget.iconName;
    ltext = widget.ltext;
    enable = widget.enable;
    keyboardType = widget.keyboardType;
    inputFormatters =
        widget.inputFormatters == null ? null : [widget.inputFormatters!];
  }
}
