import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/widget.dart';

class RowDateCustom extends StatefulWidget {
  String label;
  DateTime initialValue;
  bool enable;
  Function(DateTime value) onChange;

  RowDateCustom(
      {required this.label,
      required this.initialValue,
      this.enable = true,
      required this.onChange});

  @override
  State<RowDateCustom> createState() => _RowDateCustomState();
}

class _RowDateCustomState extends State<RowDateCustom> {
  late String label;
  late DateTime initialValue;
  late bool enable;
  late Function(DateTime value)? onChange;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  void didUpdateWidget(covariant RowDateCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('State: $enable');
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
                enabled: enable,
                onDateChanged: (value) {
                  onChange!(value);
                }),
          )
        ],
      ),
    );
  }

  void refresh() {
    label = widget.label;
    initialValue = widget.initialValue;
    enable = widget.enable;
    onChange = widget.onChange;
  }
}
