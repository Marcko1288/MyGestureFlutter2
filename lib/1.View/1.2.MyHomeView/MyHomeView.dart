import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:mygesture/9.Library/widget.dart';
import 'package:mygesture/9.Library/cash.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final screen = [
    CashView()
    // HomePageView(),
    // SearchPageView(),
    // CartView(),
    // FavoritePageView(),
    // ProfilePageView(),
  ];

  final title_screen = ['Budget'];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: buttonColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBarTitle(text: title_screen[index], icon: IconLogOut()),
          extendBody: true,
          backgroundColor: Colors.white,
          drawer: DrawerMenu(),
          body: screen[index],
        ),
      ),
    );
  }
}
