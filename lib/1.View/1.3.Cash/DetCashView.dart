import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/AppBarTitle.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldInput.dart';

class DetCashView extends StatelessWidget {
  Cash? cash;
  TypeState state;
  DetCashView({required this.state, Cash? cash}) : this.cash = cash ?? null;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime data_valore = cash != null ? cash!.data_valore : DateTime.now();
    double conto = cash != null ? cash!.conto : 0.0;
    double anticipo = cash != null ? cash!.anticipo : 0.0;
    double otherp = cash != null ? cash!.otherp : 0.0;
    double otherm = cash != null ? cash!.otherm : 0.0;

    SizeConfig().init(context);
    print('SizeConfig.screenWidth!: ${SizeConfig.screenWidth!}');
    return Scaffold(
        appBar: AppBarTitle(text: state.title),
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: GridView.count(
                padding: EdgeInsets.only(top: 20),
                crossAxisCount: SizeConfig.screenWidth! > 400 ? 2 : 1,
                children: [
                  TextFieldInput(
                      text: conto.toString(),
                      iconName: Icons.money,
                      ltext: 'Conto'),
                  TextFieldInput(
                      text: anticipo.toString(),
                      iconName: Icons.money,
                      ltext: 'Anticipo')
                ])));
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
