import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldInput.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextFieldPassword.dart';

class LoginTextField extends StatefulWidget {
  void Function(String value) onChangeMail;
  void Function(String value) onChangePassword;
  LoginTextField({required this.onChangeMail, required this.onChangePassword});

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
            onChange: (value) => widget.onChangeMail(value),
          ),
          TextFieldPassword(
            onChange: (value) => widget.onChangePassword(value),
          ),
        ]));
  }
}
