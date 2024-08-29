import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Configuration/MasterProvider.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/configuration/m_func.dart';
import 'package:mygesture/0.Class/0.2.Configuration/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextTitle.dart';
import 'package:mygesture/1.View/1.1.Login/widget/LoginButton.dart';
import 'package:mygesture/1.View/1.1.Login/widget/LoginTextField.dart';
import 'package:mygesture/1.View/1.2.MyHomeView/MyHomeView.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth! / 1.23,
                height: SizeConfig.screenHeight! / 2.874,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "images/screen_login.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, SizeConfig.screenHeight! / 68.3,
                    0, SizeConfig.screenHeight! / 11.38),
                child: Column(children: [
                  Center(
                    child: TextTitle(
                      title: "MY GESTURE",
                    ),
                  ),
                  LoginTextField(
                    onChangeMail: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onChangePassword: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  LoginButton(onPress: () {
                    logIn(context, email, password);
                  })
                ]),
              ),
              // RegisterButtonWidget()
            ],
          )
        ],
      ),
    );
  }
}

void logIn(BuildContext context, String email, String password) {
  bool result = MasterProvider.provider.logIn(email, password);
  if (result) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
