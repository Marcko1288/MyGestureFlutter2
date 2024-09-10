import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/9.Library/configuration.dart';

class TextFieldInput extends StatefulWidget {
  String text;
  IconData? iconName;
  String? ltext;
  bool enable;
  TextInputType keyboardType;
  TextInputFormatter? inputFormatters;

  void Function(String value) onChange;
  //final ValueChanged<String> onChange;
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

// class _TextFieldInputState extends State<TextFieldInput> {
//   late String text;
//   late IconData? iconName;
//   late String? ltext;
//   late bool enable;
//   late void Function(String value) onChange;
//   late TextInputType keyboardType;
//   late List<TextInputFormatter>? inputFormatters;

//   @override
//   void initState() {
//     super.initState();
//     refresh();
//   }

//   @override
//   void didUpdateWidget(covariant TextFieldInput oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     setState(() {
//       refresh();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(
//             SizeConfig.screenWidth! / 20.55,
//             SizeConfig.screenHeight! / 68.3,
//             SizeConfig.screenWidth! / 20.55,
//             SizeConfig.screenHeight! / 34.15),
//         child: TextField(
//           enabled: enable,
//           keyboardType: keyboardType,
//           inputFormatters: inputFormatters,
//           style: TextStyle(color: textColor),
//           cursorColor: textColor,
//           decoration: InputDecoration(
//               prefixIcon: Icon(iconName),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 borderSide: BorderSide(
//                     width: SizeConfig.screenWidth! / 205.5, color: textColor),

//                 /// 2
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               hintText: text,
//               hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
//               labelText: ltext,
//               labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
//           //onChanged: (value) => onChange(value),
//           onChanged: (value) {
//             setState(() {
//               widget.onChange(value);
//             });
//           },
//         ),
//       ),
//     );
//   }

//   void refresh() {
//     text = widget.text;
//     iconName = widget.iconName;
//     ltext = widget.ltext;
//     enable = widget.enable;
//     keyboardType = widget.keyboardType;
//     inputFormatters =
//         widget.inputFormatters == null ? null : [widget.inputFormatters!];
//   }
// }
//
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
          // InputDecoration(
          //   prefixIcon: Icon(iconName, color: textColor), // Colore dell'icona
          //   focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //     borderSide: BorderSide(
          //       width: SizeConfig.screenWidth! / 205.5,
          //       color: borderColor, // Colore del bordo
          //     ),
          //   ),
          //   border: OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //     borderSide: BorderSide(
          //       width:
          //           1.0, // Assicurati che la larghezza del bordo sia uniforme
          //       color: borderColor,
          //     ),
          //   ),
          //   disabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //     borderSide: BorderSide(
          //       width:
          //           1.0, // Assicurati che la larghezza del bordo sia uniforme
          //       color: borderColor,
          //     ),
          //   ),
          //   hintText: text,
          //   hintStyle: TextStyle(
          //       color: textColor.withOpacity(0.3)), // Colore del suggerimento
          //   labelText: ltext,
          //   labelStyle: TextStyle(
          //       color: textColor.withOpacity(0.6)), // Colore della label
          // ),
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
