import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/AppBarTitle.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/DatePickerCustom.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldInput.dart';
import 'package:flutterlibrary/Extension/Extension_Double.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/DatePickerCustom.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';

class DetCashView extends StatefulWidget {
  Cash? cash;
  TypeState state;

  DetCashView({required this.state, Cash? cash}) : this.cash = cash ?? null;

  @override
  State<DetCashView> createState() => _DetCashViewState();
}

class _DetCashViewState extends State<DetCashView> {
  final _formKey = GlobalKey<FormState>();

  late Cash? cash;
  late TypeState state;
  late DateTime data_valore;
  late String conto;
  late String anticipo;
  late String otherp;
  late String otherm;
  late String totale;

  @override
  void initState() {
    super.initState();
    cash = widget.cash;
    state = widget.state;
    data_valore = cash != null ? cash!.data_valore : DateTime.now();
    conto = cash != null ? cash!.conto.changeDoubleToValuta() : 'Conto';
    anticipo = cash != null ? cash!.anticipo.changeDoubleToValuta() : 'Spese +';
    otherp = cash != null
        ? cash!.otherp.changeDoubleToValuta()
        : 'Spese Straordinarie';
    otherm = cash != null ? cash!.otherm.changeDoubleToValuta() : 'Spese -';
    totale = cash != null
        ? cash!.totale.changeDoubleToValuta()
        : (0.0).changeDoubleToValuta();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print('SizeConfig.screenWidth!: ${SizeConfig.screenWidth!}');
    return Scaffold(
        appBar: AppBarTitle(text: state.title, icon: iconCustomState(state)),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // RowDateCustom('Data Valore', data_valore, (value) {
                  //   setState(() {
                  //     data_valore = value;
                  //   });
                  // }),
                  RowTextFieldCustom('Conto', conto, (value) {
                    setState(() {
                      print('value: $value, conto: $conto, totale: $totale');
                      totale = changeTotale(
                          value: totale, value_old: conto, value_new: value);
                      conto = value;
                      print('value: $value, totale: $totale, conto: $conto');
                    });
                  }),
                  // RowCustom('Spese +', anticipo, (value) {
                  //   setState(() {
                  //     totale = changeTotale(
                  //         value: totale, value_old: anticipo, value_new: value);
                  //     anticipo = value;
                  //   });
                  // }),
                  // RowCustom('Spese -', otherm, (value) {
                  //   setState(() {
                  //     totale = changeTotale(
                  //         value: totale,
                  //         value_old: otherm,
                  //         value_new: value,
                  //         invert: true);
                  //     otherm = value;
                  //   });
                  // }),
                  // RowCustom('Spese \nStraordinarie', otherp, (value) {
                  //   setState(() {
                  //     otherp = value;
                  //   });
                  // }),
                  //

                  RowTextCustom('Totale', totale, (value) {}),
                  Text('Totale: $totale'),
                ],
              )),
        ));
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

Widget RowTextFieldCustom(
    String label, String initialValue, Function(String value) onChange,
    {bool enable = true}) {
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
            onChange: (value) {
              onChange(value);
            },
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

Widget RowTextCustom(
    String label, String initialValue, Function(String value) onChange,
    {bool enable = true}) {
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

String changeTotale(
    {required String value,
    required String value_old,
    required String value_new,
    bool invert = false}) {
  double d_value_new = value_new.changeStringToDouble();
  double d_value = value.changeValutaToString().changeStringToDouble();
  double d_value_old = value_old.changeValutaToString().changeStringToDouble();

  print(
      'd_value_new: $d_value_new, d_value: $d_value, d_value_old: $d_value_old');

  if (invert) {
    d_value_old = d_value_old * -1;
    d_value_new = d_value_new * -1;
  }

  d_value -= d_value_old;
  d_value += d_value_new;
  print(
      'd_value_new: $d_value_new, d_value: $d_value, d_value_old: $d_value_old');
  return d_value.changeDoubleToValuta();
}
