import 'package:flutterlibrary/Enum/enum_custom.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:flutter/material.dart';

class DatePickerCustom extends StatefulWidget {
  DatePickerCustom({
    Key? key,
    required this.date,
    required this.onDateChanged,
    this.text_labol = '',
    this.enabled = true,
  }) : super(key: key);

  final DateTime date;
  final String text_labol;
  final bool enabled;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Se il widget è disabilitato, usa un colore grigio chiaro per i bordi e il testo
    Color borderColor = widget.enabled ? Colors.grey : Colors.grey.shade400;
    Color textColor = widget.enabled ? Colors.black : Colors.grey.shade400;
    String value =
        _selectedDate.changeDateToString(type: TypeFormatDate.DD_MM_AAAA);

    return Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.screenWidth! / 20.55,
              SizeConfig.screenHeight! / 68.3,
              SizeConfig.screenWidth! / 20.55,
              SizeConfig.screenHeight! / 34.15),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              TextField(
                enabled: false,
                style: TextStyle(color: textColor), // Colore del testo
                cursorColor: textColor,
                textAlign: TextAlign.center, // Colore del cursore
                decoration: inputDecorator(
                    borderColor: borderColor,
                    textColor: textColor,
                    iconPre: Icon(null, color: textColor),
                    iconPost: Icon(null, color: textColor),
                    text: value,
                    ltext: null),
                onChanged: null,
                onTap: widget.enabled ? _selectDate : null,
              ),
              Positioned(
                right: 0, // Posiziona l'icona a destra
                child: IconButton(
                  onPressed: widget.enabled ? _selectDate : null,
                  icon: Icon(Icons.calendar_today, color: textColor),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateChanged(_selectedDate);
      });
    }
  }
}
