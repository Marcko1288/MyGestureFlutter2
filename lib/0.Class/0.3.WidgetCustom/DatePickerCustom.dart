import 'package:flutterlibrary/Enum/enum_custom.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';
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
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 68.3,
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 34.15),
      child: InkWell(
        onTap: widget.enabled ? _selectDate : null,
        splashColor: Colors.transparent, // Rimuove il colore dello splash
        highlightColor: Colors.transparent,
        // Rimuove il colore dell'evidenziazione
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: InputDecorator(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                width: SizeConfig.screenWidth! / 205.5,
                color: Colors
                    .black, // Modifica il colore del bordo come necessario
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
            labelStyle: TextStyle(color: texthint.withOpacity(0.6)),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    "${_selectedDate.changeDateToString(type: TypeFormatDate.DD_MM_AAAA)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16, // Modifica come necessario
                    ),
                  ),
                ),
                SizedBox(width: 8), // Distanza tra il testo e l'icona
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ),
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
