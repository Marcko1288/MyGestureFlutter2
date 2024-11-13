import 'package:flutter/material.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:uuid/uuid.dart';
import 'package:flutterlibrary/Extension/Extension_Map.dart';

class Holiday implements ToDB {
  // Variabili
  String uid;
  DateTime? data_valore;
  DateTime? hour_start;
  DateTime? hour_end;
  DateTime? data_ins;
  DateTime? data_modify;

  // Costruttore
  Holiday({
    String? uid,
    required this.data_valore,
    required this.hour_start,
    required this.hour_end,
    DateTime? data_ins,
    DateTime? data_modify,
  })  : this.uid = uid ?? Uuid().v4(),
        this.data_ins = data_ins ?? DateTime.now(),
        this.data_modify = data_modify ?? DateTime.now();

  // Costruttore di default
  Holiday.standard()
      : uid = Uuid().v4(),
        data_valore = DateTime(1900, 01, 01),
        hour_start = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 08, 00),
        hour_end = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 17, 00),
        data_ins = DateTime.now(),
        data_modify = DateTime.now();

  // FROM JSON
  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      uid: json.convertJsonToString('uid'),
      data_valore: json.convertJsonToDate('data_valore'),
      hour_start: json.convertJsonToDate('hour_start'),
      hour_end: json.convertJsonToDate('hour_end'),
      data_ins: json.convertJsonToDate('data_ins'),
      data_modify: json.convertJsonToDate('data_modify'),
    );
  }

  // TO JSON
  Map<String, dynamic> toDB() => {
        'uid': uid,
        'data_valore': data_valore,
        'hour_start': hour_start,
        'hour_end': hour_end,
        'data_ins': data_ins,
        'data_modify': data_modify,
      };
}
