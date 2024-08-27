import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.2.cash/cash.dart';
import 'package:flutterlibrary/Extension/Extension_Date.dart';
import 'package:flutterlibrary/Enum/Enum_TypeDate.dart';

//Array Esempio
List<Cash> cashList = List.generate(10, (index) {
  return Cash(
    data_valore: DateTime.now()
        .startMonth()
        .addDate(value: (index - 10), type: TypeDate.M),
    conto: 100.0 * (index + 1), // Valore del conto incrementale per esempio
  );
});
