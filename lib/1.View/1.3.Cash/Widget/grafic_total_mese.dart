import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.1.Element/Cash.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/BarChartCustom.dart';
import 'package:flutterlibrary/Function/Func_MinMaxObject.dart';
import 'package:flutterlibrary/Function/Func_JumpYAss.dart';
import 'package:flutterlibrary/Extension/Extension_Double.dart';
import 'package:intl/intl.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextTitle.dart';

class GraficTotal extends StatelessWidget {
  Map<int, Cash> map_cash;
  String title;
  GraficTotal({required this.map_cash, required this.title});

  @override
  Widget build(BuildContext context) {
    List<Cash> array_cash = map_cash.values.toList();
    List<BarChartGroupData> array_date = createBarChart(
        mapData: map_cash,
        getValue: (element) => element.totale,
        barColorP: barChartsColor);
    List<double> valueMinMax =
        getMinMaxValues(array_cash, (element) => element.totale);
    double jumpValueY =
        dynamicJumpYAss(array_cash, (element) => element.totale);
    double maxY = valueMinMax[1] + (jumpValueY);
    double minY = valueMinMax[0] - (jumpValueY);
    return Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 80.55,
            SizeConfig.screenHeight! / 28.3,
            SizeConfig.screenWidth! / 80.55,
            SizeConfig.screenHeight! / 54.15),
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  12), // Modifica il valore per cambiare il raggio degli angoli
            ),
            child: Column(
              children: [
                TextTitle(title: title, size: 25.77),
                Container(
                  height: SizeConfig.screenHeight! * 0.4,
                  child: BarChartCustom(
                    array_date: array_date,
                    maxY: maxY,
                    minY: minY,
                    jumpValueY: jumpValueY,
                    funcFormatY: (value) {
                      return NumberFormat.compact().format(value);
                    },
                    funcFormatX: (index) {
                      var value = map_cash[index.toInt()]?.data_valore ??
                          DateTime.now();
                      String assX =
                          '${value.month.toString()}/${value.year.toString()}';
                      return assX;
                    },
                    funcFormatValueAx: (value) {
                      return value.changeDoubleToValuta();
                    },
                    //navigationTo: navigationTo),
                  ),
                )
              ],
            )));
  }
}
