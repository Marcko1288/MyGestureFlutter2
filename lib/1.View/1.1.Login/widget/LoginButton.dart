import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/configuration/m_func.dart';
import 'package:mygesture/0.Class/0.2.Configuration/MasterProvider.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.2.Configuration/ColorsCustom.dart';
import 'package:mygesture/1.View/1.2.MyHomeView/MyHomeView.dart';

class LoginButton extends StatefulWidget {
  void Function() onPress;
  LoginButton({required this.onPress});

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MasterProvider().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 68.3,
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 34.15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
            colors: [
              buttonColor,
              lightColor,
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.screenWidth! / 1.37,
                SizeConfig.screenHeight! / 13.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: widget.onPress,
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontSize: SizeConfig.screenHeight! / 42.68,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
