import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:mygesture/9.Library/cash.dart';
import 'package:mygesture/9.Library/widget.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class BoxGrafic extends StatefulWidget {
  const BoxGrafic({Key? key}) : super(key: key);

  @override
  _BoxGraficState createState() => _BoxGraficState();
}

class _BoxGraficState extends State<BoxGrafic> {
  int selectedSegment = 0; // Valore predefinito
  Map<int, Cash> map_grafic = {};
  Map<int, Cash> map_delta = {};

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CardBox(
        text: 'Grafico',
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
              future: loadGrafic(context, selectedSegment),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  map_grafic = snapshot.data as Map<int, Cash>;
                  if (map_grafic.isNotEmpty) {
                    List<Cash> array_delta = MasterProvider.provider
                        .grafic_delta(array_input: map_grafic.values.toList());
                    map_delta = changeListToMap(array_delta) as Map<int, Cash>;
                    return Column(
                      children: [
                        GraficTotal(
                            map_cash: map_grafic,
                            title: 'Totale',
                            details: true),
                        GraficTotal(map_cash: map_delta, title: 'Delta'),
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

Future<Map<int, Cash>> loadGrafic(
    BuildContext context, int selectedSegment) async {
  MasterProvider().init(context);
  Map<int, Cash> map_grafic = {};
  switch (selectedSegment) {
    case 0:
      List<Cash> array_cash = MasterProvider.provider.grafic_mounth();
      map_grafic = changeListToMap(array_cash) as Map<int, Cash>;
      return map_grafic;
    case 1:
      List<Cash> array_cash = MasterProvider.provider.grafic_year();
      map_grafic = changeListToMap(array_cash) as Map<int, Cash>;
      return map_grafic;
    default:
      return {};
  }
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
