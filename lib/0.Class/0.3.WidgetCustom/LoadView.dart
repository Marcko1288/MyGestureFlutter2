import 'package:flutter/material.dart';

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
