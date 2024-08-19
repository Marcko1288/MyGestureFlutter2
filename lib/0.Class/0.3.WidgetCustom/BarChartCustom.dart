import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:intl/intl.dart';

class BarChartCustom extends StatelessWidget {
  List<BarChartGroupData> array_date;
  double maxY;
  double minY;
  double jumpValueY;
  String Function(double value) funcFormatY;
  String Function(double index) funcFormatX;
  String Function(double value) funcFormatValueAx;
  //void Function(BuildContext, int) navigationTo;

  BarChartCustom(
      {required this.array_date,
      double? maxY,
      double? minY,
      double? jumpValueY,
      required this.funcFormatY,
      required this.funcFormatX,
      required this.funcFormatValueAx
      //required this.navigationTo,
      })
      : this.maxY = maxY ?? 1000,
        this.minY = minY ?? 0,
        this.jumpValueY = jumpValueY ?? 10;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY, //(maxY + (jumpValueY / 2)),
        minY: minY,
        barGroups: array_date,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval:
              jumpValueY, // Aumenta l'intervallo delle linee orizzontali
        ),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(
            showTitles: true,
            margin: 12, // Aumenta il margine tra le etichette e le barre
            reservedSize: maxY.toInt().toString().length *
                10, // Aggiungi padding tra i valori sull'asse Y
            getTitles: (value) {
              return funcFormatY(
                  value); // Formattazione personalizzata con separatori di migliaia
            },
          ),
          rightTitles:
              SideTitles(showTitles: false), // Nasconde i titoli a destra
          topTitles: SideTitles(showTitles: false), // Nasconde i titoli in alto
          bottomTitles: SideTitles(
            showTitles: true,
            margin: 8,
            getTitles: (double value) {
              return funcFormatX(value);
            },
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          enabled: true,
          touchCallback: (FlTouchEvent event, BarTouchResponse? response) {
            if (response != null &&
                response.spot != null &&
                event is FlTapUpEvent) {
              final index = response.spot!.touchedBarGroupIndex;
              // navigationTo(context,
              //     index); // Naviga verso una nuova pagina (DetailPage) quando la barra è cliccata
            }
          },
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipMargin: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                funcFormatValueAx(rod.y), // Mostra da mostrare per ogni barra
                TextStyle(
                  color: texthint,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<BarChartGroupData> createBarChart<T>({
  required Map<int, T> mapData,
  required double Function(T element)
      getValue, // Funzione per estrarre il valore dal campo dell'oggetto
  Color barColorP = Colors.blue, // Colore di default delle barre
  Color barColorN = Colors.red, // Colore di default delle barre
  double barWidth = 10, // Larghezza di default delle barre
}) {
  List<BarChartGroupData> arrayBar = [];

  mapData.forEach((key, value) {
    Color color = getValue(value) > 0.0 ? barColorP : barColorN;
    arrayBar.add(BarChartGroupData(
      x: key,
      barRods: [
        BarChartRodData(
          y: getValue(
              value), // Usa la funzione getValue per ottenere il campo desiderato
          colors: [color],
          width: barWidth,
        ),
      ],
      showingTooltipIndicators: [0],
    ));
  });

  return arrayBar;
}
