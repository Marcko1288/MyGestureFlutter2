import 'package:flutter/material.dart';

class DefaultView extends StatelessWidget {
  const DefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default View'),
      ),
      body: Column(
        children: [
          Text(
            'COMING SOON ....',
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
