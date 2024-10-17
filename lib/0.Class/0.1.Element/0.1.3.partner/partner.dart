import 'package:flutter/material.dart';
import 'package:flutterlibrary/Extension/Extension_List.dart';
import 'package:uuid/uuid.dart';
import 'package:flutterlibrary/Extension/Extension_Map.dart';

class Partner implements ToDB {
  // Variabili
  late String uid;
  late String email;
  late String nome;
  late String cognome;
  late String username;
  late DateTime data_ins;
  late DateTime data_modify;

  // Costruttore
  Partner({
    String? uid,
    required this.email,
    String? nome,
    String? cognome,
    String? username,
    DateTime? data_ins,
    DateTime? data_modify,
  })  : this.uid = uid ?? Uuid().v4(),
        this.nome = nome ?? '',
        this.cognome = cognome ?? '',
        this.username = username ?? '',
        this.data_ins = data_ins ?? DateTime.now(),
        this.data_modify = data_modify ?? DateTime.now();

  // Costruttore di default
  Partner.standard({
    this.email = '',
  })  : this.uid = Uuid().v4(),
        this.nome = '',
        this.cognome = '',
        this.username = '',
        this.data_ins = DateTime.now(),
        this.data_modify = DateTime.now();

  //FROM JSON
  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
        uid: json.convertJsonToString('uid'),
        email: json.convertJsonToString('email'),
        nome: json.convertJsonToString('nome'),
        cognome: json.convertJsonToString('cognome'),
        username: json.convertJsonToString('username'),
        data_ins: json.convertJsonToDate('data_ins'),
        data_modify: json.convertJsonToDate('data_modify'));
  }

  //TO JSON
  Map<String, dynamic> toDB() => {
        'uid': uid,
        'email': email,
        'nome': nome,
        'cognome': cognome,
        'username': username,
        'data_ins': data_ins,
        'data_modify': data_modify,
      };
}
