import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldInput.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldPassword.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          TextFieldInput(
            text: "Email",
            iconName: Icons.mail,
            ltext: "Email",
          ),
          TextFieldPassword(),
        ]));
  }
}
