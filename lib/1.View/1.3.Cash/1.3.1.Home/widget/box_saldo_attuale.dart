import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/cash.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:mygesture/9.Library/widget.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';
import 'package:mygesture/1.View/1.9.Other/DefaultView.dart';

class BoxSaldo extends StatefulWidget {
  const BoxSaldo({Key? key}) : super(key: key);

  @override
  _BoxSaldoState createState() => _BoxSaldoState();
}

class _BoxSaldoState extends State<BoxSaldo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CardBox(
        text: 'Saldo Attuale',
        widget: FutureBuilder<String>(
          future: bringTheFoods(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String value = snapshot.data as String;
              return ButtonToView(
                title: value,
                widget: DetCashView(state: TypeState.insert),
              );
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

Future<String> bringTheFoods(BuildContext context) async {
  MasterProvider().init(context);
  Cash cash = MasterProvider.provider.last_value();
  return cash.totale.changeDoubleToValuta();
}
