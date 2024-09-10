import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygesture/9.Library/widget.dart';

class RowTextFieldCustom extends StatefulWidget {
  String label;
  String initialValue;
  bool enable;
  TextInputType keyboardType;
  dynamic? inputFormatters;
  Function(String value) onChange;

  RowTextFieldCustom({
    required this.label,
    required this.initialValue,
    this.enable = true,
    this.keyboardType = TextInputType.none,
    this.inputFormatters = null,
    required this.onChange,
  });

  @override
  State<RowTextFieldCustom> createState() => _RowTextFieldCustomState();
}

class _RowTextFieldCustomState extends State<RowTextFieldCustom> {
  late String label;
  late String initialValue;
  late bool enable;
  late TextInputType keyboardType;
  late TextInputFormatter? inputFormatters;
  late Function(String value) onChange;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  void didUpdateWidget(covariant RowTextFieldCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
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

  void refresh() {
    label = widget.label;
    initialValue = widget.initialValue;
    enable = widget.enable;
    keyboardType = widget.keyboardType;
    inputFormatters = widget.inputFormatters;
    onChange = widget.onChange;
  }
}
