import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:mygesture/9.Library/widget.dart';
import 'package:mygesture/9.Library/master.dart';
import 'package:mygesture/9.Library/login.dart';
import 'package:mygesture/9.Library/myhome.dart';

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

void logIn(BuildContext context, String email, String password) async {
  bool result = await MasterProvider.provider.logIn(email, password);
  if (result) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
