import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';

class CardBox extends StatelessWidget {
  String text;
  Widget widget;

  CardBox({required this.text, required this.widget});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              SizeConfig.screenWidth! / 50.55, // Padding simmetrico orizzontale
          vertical:
              SizeConfig.screenHeight! / 104.15, // Padding simmetrico verticale
        ),
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget
                    ], // Mostra il widget passato come parametro
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
