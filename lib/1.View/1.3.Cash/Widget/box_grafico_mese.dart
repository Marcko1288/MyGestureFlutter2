import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/Cash.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Struct/Es_Array.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/BarChartCustom.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/CardBox.dart';
import 'package:mygesture/1.View/1.3.Cash/Widget/Grafico.dart';
import 'package:flutterlibrary/Function/Func_MinMaxObject.dart';
import 'package:flutterlibrary/Function/Func_JumpYAss.dart';
import 'package:flutterlibrary/Extension/Extension_Date.dart';
import 'package:flutterlibrary/Extension/Extension_Double.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:flutterlibrary/Enum/Enum_TypeSort.dart';

class BoxGraficMounth extends StatefulWidget {
  const BoxGraficMounth({Key? key}) : super(key: key);

  @override
  _BoxGraficMounthState createState() => _BoxGraficMounthState();
}

class _BoxGraficMounthState extends State<BoxGraficMounth> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CardBox(
        text: 'Grafico Mensile',
        widget: FutureBuilder<Map<int, Cash>>(
          future: bringGraficMounth(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<int, Cash> map_cash = snapshot.data as Map<int, Cash>;
              if (map_cash.isNotEmpty) {
                List<Cash> array_cash = map_cash.values.toList();
                List<BarChartGroupData> array_date = createBarChart(map_cash);
                List<double> valueMinMax =
                    getMinMaxValues(array_cash, (element) => element.totale);
                double jumpValueY =
                    dynamicJumpYAss(array_cash, (element) => element.totale);
                //maxY * ((maxY - minY) / maxY);
                //dynamicJumpYAss(array_cash, (element) => element.totale);
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
                        height: SizeConfig.screenHeight! * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              12), // Modifica il valore per cambiare il raggio degli angoli
                        ),
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
                        )));
              } else {
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
                        child: Text('Dati non disponibili')));
              }
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

Future<Map<int, Cash>> bringGraficMounth() async {
  Map<int, Cash> map_cash = {};
  List<Cash> array_cash = cashList;
  array_cash.customSort((element) => element.data_valore, TypeSort.DO);

  for (var i = 0; i < 3; i++) {
    map_cash[i] = array_cash[i];
  }
  return map_cash;
}

List<BarChartGroupData> createBarChart(Map<int, Cash> map_cash) {
  List<BarChartGroupData> array_bar = [];

  map_cash.forEach((key, value) {
    array_bar.add(BarChartGroupData(
      x: key,
      barRods: [
        BarChartRodData(
          y: value.totale,
          colors: [barChartsColor],
          width: 10,
        ),
      ],
      showingTooltipIndicators: [0],
    ));
  });

  return array_bar;
}
