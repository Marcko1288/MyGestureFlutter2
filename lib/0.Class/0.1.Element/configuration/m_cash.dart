import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/Cash.dart';
import 'package:mygesture/0.Class/0.1.Element/Master.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:flutterlibrary/Enum/Enum_TypeSort.dart';

extension Func_MCash on Master {
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

    print('array_cash: ${array_cash.length}');

    array_cash.forEach((element) {
      if (element.data_valore.month != mounth &&
          element.data_valore.year != year &&
          i <= limit) {
        array_output.add(element);
        mounth = element.data_valore.month;
        year = element.data_valore.year;
        i++;
      }
    });

    print('array_output: ${array_output.length}');
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
}

Map<int, Cash> changeListToMap(List<Cash> array_input) {
  Map<int, Cash> map_output = {};

  for (var i = 0; i < array_input.length; i++) {
    map_output[i] = array_input[i];
  }
  map_output.forEach((key, value) {
    print('key: $key : value: $value');
  });

  return map_output;
}