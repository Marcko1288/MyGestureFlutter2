import 'package:flutter/material.dart';

import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/ButtonToView.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/CardBox.dart';
import 'package:mygesture/1.View/1.2.MyHomeView/MyHomeView.dart';

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
          future: bringTheFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String value = snapshot.data as String;
              return ButtonToView(title: value);
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

Future<String> bringTheFoods() async {
  return 'Hello World!';
}
