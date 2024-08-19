import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/AppBarTitle.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/IconLogOut.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/DrawerMenu.dart';
import 'package:mygesture/1.View/1.3.Cash/CashView.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: buttonColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBarTitle(text: "Budget", icon: IconLogOut()),
          extendBody: true,
          backgroundColor: Colors.white,
          drawer: DrawerMenu(),
          body: screen[index],
        ),
      ),
    );
  }
}
