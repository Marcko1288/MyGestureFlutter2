import 'package:flutter/material.dart';
import 'package:flutterlibrary/Firebase/firebase_custom.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/master.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/configuration/m_func.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:flutterlibrary/Enum/Enum_TypeSort.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.9.ex_array/exarray_cash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension Func_MCash on Master {
  Future<bool> loadDBCash() async {
    try {
      this.array_cash.clear();
      var patch = FireStore()
          .dirDB(db: 'NewMyDB', document: this.partner.uid, value: 'Cash');
      var result = await FireStore().queryFireStore(patch: patch);
      result.forEach((element) {
        var cash = Cash.fromJson(element);
        this.array_cash.add(cash);
      });
    } on FirebaseException catch (error) {
      print('Estrazione Budget KO \n ${error.toString()}');
      this.gestion_Message(
          'Estrazione dati Budget in errore. \n ${error.toString()}');
      notifyListeners();
      return false;
    }

    this.array_cash = cashList;
    return true;
  }

  Cash last_value() {
    List<Cash> array_cash = this.array_cash;

    if (array_cash.isEmpty) {
      return Cash.standard();
    } else {
      array_cash.customSort((element) => element.data_valore, TypeSort.DO);
      return array_cash.first;
    }
  }

  List<Cash> grafic_mounth({int limit = 3}) {
    List<Cash> array_output = [];

    List<Cash> array_cash = this.array_cash;
    array_cash.customSort((element) => element.data_valore, TypeSort.DO);
    int mounth = 0;
    int year = 0;
    int i = 0;
    array_cash.forEach((element) {
      if (element.data_valore.year != year ||
          element.data_valore.month != mounth) {
        if (i < limit) {
          array_output.add(element);
          mounth = element.data_valore.month;
          year = element.data_valore.year;
          i++;
        }
      }
    });

    array_output.customSort((element) => element.data_valore, TypeSort.DO);
    return array_output;
  }

  List<Cash> grafic_year({int limit = 3}) {
    List<Cash> array_output = [];

    List<Cash> array_cash = this.array_cash;
    array_cash.customSort((element) => element.data_valore, TypeSort.UP);
    int year = 0;
    int i = 0;
    int length = array_cash.length - 1;

    array_cash.forEach((element) {
      if (element.data_valore.year != year) {
        array_output.add(element);
        year = element.data_valore.year;
      } else if (year == DateTime.now().year && i == length) {
        array_output.add(element);
      }
      i++;
    });

    array_output = array_output.take(limit).toList();

    array_output.customSort((element) => element.data_valore, TypeSort.DO);
    return array_output;
  }

  List<Cash> grafic_delta({required List<Cash> array_input, int limit = 3}) {
    List<Cash> array_output = [];
    List<Cash> array_cash = array_input;
    limit--;

    array_cash.customSort((element) => element.data_valore, TypeSort.UP);

    double totale_old = 0.0;
    for (var i = 0; i < array_cash.length; i++) {
      if (i == 0) {
        totale_old = array_cash[i].totale;
      } else {
        var cash = Cash(
            data_valore: array_cash[i].data_valore,
            conto: array_cash[i].totale - totale_old);
        array_output.add(cash);
        totale_old = array_cash[i].totale;
      }
    }

    array_output = array_output.take(limit).toList();

    array_output.customSort((element) => element.data_valore, TypeSort.DO);

    return array_output;
  }

  bool insertCash(Cash cash) {
    return true;
  }

  bool modifyCash(Cash cash) {
    return true;
  }

  bool deleteCash(Cash cash) {
    return true;
  }
}

Map<int, Cash> changeListToMap(List<Cash> array_input) {
  Map<int, Cash> map_output = {};

  for (var i = 0; i < array_input.length; i++) {
    map_output[i] = array_input[i];
  }
  return map_output;
}
