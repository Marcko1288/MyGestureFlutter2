import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/cash.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:mygesture/9.Library/widget.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';

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
  late double conto;
  late double anticipo;
  late double otherp;
  late double otherm;
  late double totale;

  @override
  void initState() {
    super.initState();
    cash = widget.cash;
    state = TypeState.modify; //widget.state;
    data_valore = cash != null ? cash!.data_valore : DateTime.now();
    conto = cash != null ? cash!.conto : 0.0;
    anticipo = cash != null ? cash!.anticipo : 0.0;
    otherp = cash != null ? cash!.otherp : 0.0;
    otherm = cash != null ? cash!.otherm : 0.0;
    totale = cash != null ? cash!.totale : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBarTitle(
            text: state.title,
            icon: iconCustomState(
              state,
              () {},
            )),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowDateCustom('Data Valore', data_valore, (value) {
                    setState(() {
                      data_valore = value;
                    });
                  }),
                  RowTextFieldCustom('Conto', conto.changeDoubleToValuta(),
                      (value) {
                    setState(() {
                      double number = value.changeStringToDouble();
                      totale = changeTotale(
                          value: totale, value_old: conto, value_new: number);
                      conto = number;
                    });
                  }),
                  RowTextFieldCustom('Spesa +', anticipo.changeDoubleToValuta(),
                      (value) {
                    setState(() {
                      double number = value.changeStringToDouble();
                      totale = changeTotale(
                          value: totale,
                          value_old: anticipo,
                          value_new: number);
                      anticipo = number;
                    });
                  }),
                  RowTextFieldCustom('Spesa -', otherm.changeDoubleToValuta(),
                      (value) {
                    setState(() {
                      double number = value.changeStringToDouble();
                      totale = changeTotale(
                          value: totale,
                          value_old: otherm,
                          value_new: number,
                          invert: true);
                      otherm = number;
                    });
                  }),
                  RowTextFieldCustom(
                      'Spese \nStraordinarie', otherp.changeDoubleToValuta(),
                      (value) {
                    setState(() {
                      double number = value.changeStringToDouble();
                      otherp = number;
                    });
                  }),
                  RowTextCustom(
                      'Totale', totale.changeDoubleToValuta(), (value) {}),
                  if (state == TypeState.modify)
                    Center(
                      child: ButtonToDelete(title: 'Cancella', onPress: () {}),
                    )
                ],
              )),
        ));
  }
}

double changeTotale(
    {required double value,
    required double value_old,
    required double value_new,
    bool invert = false}) {
  if (invert) {
    value_old = value_old * -1;
    value_new = value_new * -1;
  }

  value -= value_old;
  value += value_new;

  return value;
}
