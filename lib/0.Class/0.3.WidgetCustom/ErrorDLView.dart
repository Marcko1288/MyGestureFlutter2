import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';

class ErrorDLView extends StatelessWidget {
  ErrorDLView({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
