import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';

class Master with ChangeNotifier {
  final messageVideo = GlobalKey<ScaffoldMessengerState>();

  //late Partner user;
  late List<Cash> array_cash;

  Master.standard() : this.array_cash = [];
}
