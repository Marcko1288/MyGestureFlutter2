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
        widget: FutureBuilder<Cash>(
          future: loadDBLastValue(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Cash cash = snapshot.data as Cash;
              String value = cash.totale.changeDoubleToValuta();
              return ButtonToView(
                title: value,
                widget: DetCashView(state: TypeState.read, cash: cash),
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

Future<Cash> loadDBLastValue(BuildContext context) async {
  MasterProvider().init(context);
  Cash cash = MasterProvider.provider.last_value();
  return cash;
}
