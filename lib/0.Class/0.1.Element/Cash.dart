import 'package:flutter/material.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:uuid/uuid.dart';
import 'package:flutterlibrary/Extension/Extension_Map.dart';

class Cash implements ToDB {
  // Variabili
  late String uid;
  late DateTime data_valore;
  late double conto;
  late double anticipo;
  late double otherp;
  late double otherm;
  late double totale;
  late DateTime data_ins;
  late DateTime data_modify;

  // Costruttore
  Cash({
    String? uid,
    required this.data_valore,
    required this.conto,
    double? anticipo,
    double? otherp,
    double? otherm,
    DateTime? data_ins,
    DateTime? data_modify,
  })  : this.uid = uid ?? Uuid().v4(),
        this.anticipo = anticipo ?? 0.0,
        this.otherp = otherp ?? 0.0,
        this.otherm = otherm ?? 0.0,
        this.totale = conto + (anticipo ?? 0.0) - (otherm ?? 0.0),
        this.data_ins = data_ins ?? DateTime.now(),
        this.data_modify = data_modify ?? DateTime.now();

  // Costruttore di default
  Cash.standard({
    this.conto = 0.0,
  })  : this.uid = Uuid().v4(),
        this.data_valore = DateTime.now(),
        this.anticipo = 0.0,
        this.otherp = 0.0,
        this.otherm = 0.0,
        this.totale = 0.0,
        this.data_ins = DateTime.now(),
        this.data_modify = DateTime.now();

  //FROM JSON
  factory Cash.fromJson(Map<String, dynamic> json) {
    return Cash(
        uid: json.convertJsonToString('uid'),
        data_valore: json.convertJsonToDate('data_valore'),
        conto: json.convertJsonToDouble('conto'),
        anticipo: json.convertJsonToDouble('anticipo'),
        otherp: json.convertJsonToDouble('otherp'),
        otherm: json.convertJsonToDouble('otherm'),
        data_ins: json.convertJsonToDate('data_ins'),
        data_modify: json.convertJsonToDate('data_modify'));
  }

  //TO JSON
  Map<String, dynamic> toDB() => {
        'uid': uid,
        'data_valore': data_valore,
        'conto': conto,
        'anticipo': anticipo,
        'otherp': otherp,
        'otherm': otherm,
        'data_ins': data_ins,
        'data_modify': data_modify,
      };
}
