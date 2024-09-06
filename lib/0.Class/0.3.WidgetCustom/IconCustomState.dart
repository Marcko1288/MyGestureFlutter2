import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';

class IconCustomState extends IconButton {
  TypeState typeState;
  IconCustomState(
      {Key? key, required this.typeState, required VoidCallback onPressed})
      : super(
          key: key,
          icon: detIcon(typeState),
          onPressed: onPressed,
        );
}

Icon detIcon(TypeState typeState) {
  switch (typeState) {
    case TypeState.insert:
      return Icon(Icons.save);
    case TypeState.modify:
      return Icon(Icons.save);
    case TypeState.read:
      return Icon(Icons.mode_edit_outline_outlined);
  }
}

// class IconCustomState extends StatefulWidget {
//   TypeState typeState;
//   Function() onPress;

//   IconCustomState(required TypeState typeState, required Function() onPress);

//   @override
//   State<IconCustomState> createState() => _IconCustomStateState();
// }

// class _IconCustomStateState extends State<IconCustomState> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// IconButton iconCustomState(TypeState typeState, Function() onPress) {
//   switch (typeState) {
//     case TypeState.insert:
//       return IconButton(icon: Icon(Icons.save), onPressed: onPress);
//     case TypeState.modify:
//       return IconButton(icon: Icon(Icons.save), onPressed: onPress);
//     case TypeState.read:
//       return IconButton(
//           icon: Icon(Icons.mode_edit_outline_outlined), onPressed: onPress);
//   }
// }
