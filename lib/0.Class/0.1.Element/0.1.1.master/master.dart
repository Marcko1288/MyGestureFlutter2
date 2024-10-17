import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.3.partner/partner.dart';

class Master with ChangeNotifier {
  final messageVideo = GlobalKey<ScaffoldMessengerState>();

  late Partner partner;
  late List<Cash> array_cash;

  Master.standard() : this.array_cash = [];
}
