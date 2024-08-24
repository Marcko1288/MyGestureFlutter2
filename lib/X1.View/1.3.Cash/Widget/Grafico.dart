import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa la libreria intl per formattare i numeri

class OverlappingBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300, // Imposta un'altezza fissa per il grafico
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 60260,
              minY: -10500,
              barGroups: _getBarGroups(),
              gridData: FlGridData(
                drawVerticalLine: false,
                horizontalInterval:
                    10000, // Aumenta l'intervallo delle linee orizzontali
              ),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: true,
                  margin: 12, // Aumenta il margine tra le etichette e le barre
                  reservedSize: 20, // Aggiungi padding tra i valori sull'asse Y
                  getTitles: (value) {
                    return NumberFormat.compact().format(
                        value); // Formattazione personalizzata con separatori di migliaia
                  },
                ),
                rightTitles:
                    SideTitles(showTitles: false), // Nasconde i titoli a destra
                topTitles:
                    SideTitles(showTitles: false), // Nasconde i titoli in alto
                bottomTitles: SideTitles(
                  showTitles: true,
                  margin: 8,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Gen';
                      case 1:
                        return 'Feb';
                      case 2:
                        return 'Mar';
                      case 3:
                        return 'Apr';
                      default:
                        return '';
                    }
                  },
                ),
              ),
              borderData: FlBorderData(show: false),
              barTouchData: BarTouchData(
                enabled: true,
                touchCallback:
                    (FlTouchEvent event, BarTouchResponse? response) {
                  if (response != null &&
                      response.spot != null &&
                      event is FlTapUpEvent) {
                    final index = response.spot!.touchedBarGroupIndex;

                    // Naviga verso una nuova pagina (DetailPage) quando la barra è cliccata
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(index: index),
                      ),
                    );
                  }
                },
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipMargin: 8,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '${rod.y.round()}', // Mostra il valore arrotondato
                      TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            y: -970,
            colors: [Colors.blue.withOpacity(0.8)],
            width: 20,
          ),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            y: 42000,
            colors: [Colors.red.withOpacity(0.8)],
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            y: 45000,
            colors: [Colors.yellow.withOpacity(0.8)],
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            y: 44000,
            colors: [Colors.green.withOpacity(0.8)],
            width: 20,
          ),
        ],
      ),
    ];
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettagli Istogramma'),
      ),
      body: Center(
        child: Text('Dettagli per la barra con indice: $index'),
      ),
    );
  }
}
