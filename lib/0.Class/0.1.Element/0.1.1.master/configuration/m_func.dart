import 'package:flutter/material.dart';
import 'package:flutterlibrary/Enum/enum_custom.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/master.dart';
import 'package:flutterlibrary/Firebase/firebase_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.3.partner/partner.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.3.partner/configuration/m_partner.dart';

extension Func_Master on Master {
  void gestion_Message(String message) {
    var snackBar = SnackBar(content: Text(message));
    this.messageVideo.currentState?.showSnackBar(snackBar);
  }

  Future<bool> logIn(String email, String password) async {
    try {
      await Auth().signInWithEmailAndPassword(email: email, password: password);
      print('Accesso OK');
      var result = this.loadDBPartner(Auth().currentUser!.uid);

      notifyListeners();
      return result;
    } on FirebaseAuthException catch (error) {
      print('Accesso KO');
      this.gestion_Message(
          'Autentificazione Fallita! Verificare Email/Passord inseriti. \n ${error.toString()}');
      notifyListeners();
      return false;
    }
    //return true;
  }

  void logOut() {
    this.array_cash.clear();
    Auth().singOut();
    notifyListeners();
  }
}
