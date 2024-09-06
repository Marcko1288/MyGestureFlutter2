import 'package:flutter/material.dart';

enum TypeState {
  insert,
  modify,
  read,
}

extension ExtTypeState on TypeState {
  String get title {
    switch (this) {
      case TypeState.insert:
        return 'Nuovo';
      case TypeState.modify:
        return 'Modifica';
      case TypeState.read:
        return 'Dettaglio';
    }
  }

  bool get state {
    switch (this) {
      case TypeState.insert:
        return true;
      case TypeState.modify:
        return true;
      case TypeState.read:
        return false;
    }
  }
}
