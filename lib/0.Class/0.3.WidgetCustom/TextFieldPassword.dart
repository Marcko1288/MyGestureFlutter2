import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';

class TextFieldPassword extends StatefulWidget {
  void Function(String value) onChange;

  TextFieldPassword({required this.onChange});

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextField(
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordObscure = !passwordObscure;
                  });
                },
                icon: Icon(
                    passwordObscure ? Icons.visibility_off : Icons.visibility),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: "Password",
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
          onChanged: (value) => widget.onChange(value),
        ),
      ),
    );
  }
}
