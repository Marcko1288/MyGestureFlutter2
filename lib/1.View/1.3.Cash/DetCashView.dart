import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/AppBarTitle.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/DatePickerCustom.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldInput.dart';
import 'package:flutterlibrary/Extension/Extension_Double.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/DatePickerCustom.dart';

class DetCashView extends StatelessWidget {
  Cash? cash;
  TypeState state;
  DetCashView({required this.state, Cash? cash}) : this.cash = cash ?? null;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime data_valore = cash != null ? cash!.data_valore : DateTime.now();
    String conto = cash != null ? cash!.conto.changeDoubleToValuta() : 'Conto';
    String anticipo =
        cash != null ? cash!.anticipo.changeDoubleToValuta() : 'Spese +';
    String otherm =
        cash != null ? cash!.otherm.changeDoubleToValuta() : 'Spese -';
    String otherp = cash != null
        ? cash!.otherp.changeDoubleToValuta()
        : 'Spese Straordinarie';

    SizeConfig().init(context);
    print('SizeConfig.screenWidth!: ${SizeConfig.screenWidth!}');
    return Scaffold(
        appBar: AppBarTitle(text: state.title, icon: iconCustomState(state)),
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowDateCustom('Data Valore', data_valore, (value) {
                  data_valore = value;
                }),
                RowCustom('Conto', conto, (value) {
                  conto = value;
                }),
                RowCustom('Spese +', anticipo, (value) {
                  anticipo = value;
                }),
                RowCustom('Spese -', otherm, (value) {
                  otherm = value;
                }),
                RowCustom('Spese \nStraordinarie', otherp, (value) {
                  otherp = value;
                })
              ],
            )));
  }
}

enum TypeState {
  insert,
  modify,
  read,
}

extension ExtTypeState on TypeState {
  String get title {
    switch (this) {
      case TypeState.insert:
        return 'Nuovo';
      case TypeState.modify:
        return 'Modifica';
      case TypeState.read:
        return 'Dettaglio';
    }
  }
}

Widget RowCustom(
    String label, String initialValue, Function(String value) onChange) {
  return Padding(
    padding: EdgeInsets.all(10),
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
          child: TextFieldInput(
            text: initialValue,
            onChange: onChange,
          ),
        )
      ],
    ),
  );
}

Widget RowDateCustom(
    String label, DateTime initialValue, Function(DateTime value) onChange) {
  return Padding(
    padding: EdgeInsets.all(10),
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

IconButton iconCustomState(TypeState typeState) {
  switch (typeState) {
    case TypeState.insert:
      return IconButton(icon: Icon(Icons.save), onPressed: () {});
    case TypeState.modify:
      return IconButton(icon: Icon(Icons.save), onPressed: () {});
    case TypeState.read:
      return IconButton(
          icon: Icon(Icons.mode_edit_outline_outlined), onPressed: () {});
  }
}
