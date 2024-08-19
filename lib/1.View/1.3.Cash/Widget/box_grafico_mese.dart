import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.1.Element/Cash.dart';
import 'package:mygesture/0.Class/0.2.Struct/Es_Array.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/LoadView.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/ErrorDLView.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/CardBox.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:flutterlibrary/Enum/Enum_TypeSort.dart';
import 'package:mygesture/1.View/1.3.Cash/Widget/grafic_total_mese.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class BoxGraficMounth extends StatefulWidget {
  const BoxGraficMounth({Key? key}) : super(key: key);

  @override
  _BoxGraficMounthState createState() => _BoxGraficMounthState();
}

class _BoxGraficMounthState extends State<BoxGraficMounth> {
  int selectedSegment = 0; // Valore predefinito

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CardBox(
        text: 'Grafico Mensile',
        widget: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MaterialSegmentedControl(
                  children: selectPeriod,
                  selectionIndex: selectedSegment,
                  borderColor: buttonColor.withOpacity(0.2),
                  selectedColor: buttonColor,
                  unselectedColor: registerColor,
                  selectedTextStyle: TextStyle(color: Colors.white),
                  unselectedTextStyle:
                      TextStyle(color: Colors.black.withOpacity(0.5)),
                  borderWidth: 0.7,
                  borderRadius: 40.0,
                  disabledChildren: [3],
                  onSegmentTapped: (index) {
                    setState(() {
                      selectedSegment = index;
                    });
                  },
                )),
            FutureBuilder<Map<int, Cash>>(
              future: bringGraficMounth(selectedSegment),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<int, Cash> map_cash = snapshot.data as Map<int, Cash>;
                  if (map_cash.isNotEmpty) {
                    Map<int, Cash> map_cash_delta = extractDelta(map_cash);
                    return Column(
                      children: [
                        GraficTotal(map_cash: map_cash, title: 'Totale'),
                        GraficTotal(map_cash: map_cash_delta, title: 'Delta'),
                      ],
                    );
                  } else {
                    return ErrorDLView();
                  }
                }
                return LoadView();
              },
            )
          ],
        ));
  }
}

Future<Map<int, Cash>> bringGraficMounth(int selectedSegment) async {
  Map<int, Cash> map_cash = {};
  List<Cash> array_cash = cashList;
  array_cash.customSort((element) => element.data_valore, TypeSort.DO);

  for (var i = 0; i < 3; i++) {
    map_cash[i] = array_cash[i];
  }
  return map_cash;
}

Map<int, Cash> extractDelta(Map<int, Cash> map_cash) {
  Map<int, Cash> map_cash_output = {};
  List<Cash> array_cash = map_cash.values.toList();

  array_cash.customSort((element) => element.data_valore, TypeSort.UP);

  double totale_old = 0.0;
  List<Cash> array_app = [];
  for (var i = 0; i < array_cash.length; i++) {
    if (i == 0) {
      totale_old = array_cash[i].totale;
    } else {
      var cash = Cash(
          data_valore: array_cash[i].data_valore,
          conto: array_cash[i].totale - totale_old);
      array_app.add(cash);
      totale_old = array_cash[i].totale;
    }
  }

  array_app.customSort((element) => element.data_valore, TypeSort.DO);
  for (var i = 0; i < array_app.length; i++) {
    map_cash_output[i] = array_app[i];
  }

  return map_cash_output;
}

Map<int, Widget> selectPeriod = {
  0: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Text('Mensile'),
  ),
  1: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Text('Annuale'),
  )
};
