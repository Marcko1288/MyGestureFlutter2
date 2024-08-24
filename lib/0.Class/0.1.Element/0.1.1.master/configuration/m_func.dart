import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/master/master.dart';

extension Func_Master on Master {
  void gestion_Message(String message) {
    var snackBar = SnackBar(content: Text(message));
    this.messageVideo.currentState?.showSnackBar(snackBar);
  }

  void logIn(String email, String password) {
    notifyListeners();
  }

  void logOut() {
    this.array_cash.clear();
    notifyListeners();
  }
}
