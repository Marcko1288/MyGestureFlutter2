import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Configuration/MasterProvider.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/ButtonToView.dart';
import 'package:mygesture/1.View/1.3.Cash/1.3.1.Home/widget/box_grafico.dart';
import 'package:mygesture/1.View/1.3.Cash/1.3.1.Home/widget/box_saldo_attuale.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/IconLogOut.dart';
import 'package:mygesture/1.View/1.9.Other/DefaultView.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/configuration/m_cash.dart';

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
                ButtonToView(title: 'Storico', widget: DefaultView()),
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
  bool result = MasterProvider.provider.loadDBCash();

  if (result) {
    return true;
  } else {
    return false;
  }
}
