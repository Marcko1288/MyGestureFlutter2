import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';

class LoadView extends StatelessWidget {
  LoadView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
