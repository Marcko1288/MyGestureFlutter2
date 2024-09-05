import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';

IconButton iconCustomState(TypeState typeState, Function() onPress) {
  switch (typeState) {
    case TypeState.insert:
      return IconButton(icon: Icon(Icons.save), onPressed: onPress);
    case TypeState.modify:
      return IconButton(icon: Icon(Icons.save), onPressed: onPress);
    case TypeState.read:
      return IconButton(
          icon: Icon(Icons.mode_edit_outline_outlined), onPressed: onPress);
  }
}
