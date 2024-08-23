import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/CardBox.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/ButtonToView.dart';
import 'package:mygesture/1.View/1.3.Cash/Widget/box_grafico.dart';
import 'package:mygesture/1.View/1.3.Cash/Widget/box_saldo_attuale.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/IconLogOut.dart';

class CashView extends StatefulWidget {
  const CashView({Key? key}) : super(key: key);

  @override
  _CashViewState createState() => _CashViewState();
}

class _CashViewState extends State<CashView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: FutureBuilder<bool>(
        future: bringDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                BoxSaldo(),
                BoxGrafic(),
                ButtonToView(title: 'Storico'),
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Dati non scaricati!'),
                IconLogOut(),
              ],
            );
          }
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}

Future<bool> bringDB() async {
  return true;
}
