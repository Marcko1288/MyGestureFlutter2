import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.3.partner/partner.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/master.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/configuration/m_func.dart';
import 'package:flutterlibrary/Enum/enum_custom.dart';
import 'package:flutterlibrary/Firebase/firebase_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension Func_MPartner on Master {
  Future<bool> loadDBPartner(String uid) async {
    try {
      var patch =
          FireStore().dirDB(db: 'NewMyDB', document: uid, value: 'Cash');
      var result = await FireStore().queryFireStore(
          type: TypeQuery.EQ, patch: patch, campo: 'uid', value: uid);

      this.partner = Partner.fromJson(result.first);
    } on FirebaseException catch (error) {
      print('Estrazione Partner KO. \n ${error.toString()}');
      this.gestion_Message(
          'Estrazione Partner in errore. \n ${error.toString()}');
      notifyListeners();
      return false;
    }

    return true;
  }

  bool insertPartner(Partner partner) {
    return true;
  }

  bool modifyPartner(Partner partner) {
    return true;
  }

  bool deletePartner(Partner partner) {
    return true;
  }
}
