import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/Cash.dart';
import 'package:mygesture/0.Class/0.2.Struct/Es_Array.dart';

class Master with ChangeNotifier {
  final messageVideo = GlobalKey<ScaffoldMessengerState>();

  late List<Cash> array_cash;

  Master.standard() : this.array_cash = [];

  void gestion_Message(String message) {
    var snackBar = SnackBar(content: Text(message));
    this.messageVideo.currentState?.showSnackBar(snackBar);
  }

  void logIn(String email, String password) {
    this.array_cash = cashList;
    notifyListeners();
  }

  void logOut() {
    this.array_cash.clear();
    notifyListeners();
  }
}
