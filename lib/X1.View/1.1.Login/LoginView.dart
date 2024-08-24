import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextTitle.dart';
import 'package:mygesture/1.View/1.1.Login/Widget/LoginButton.dart';
import 'package:mygesture/1.View/1.1.Login/Widget/LoginTextField.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                decoration: BoxDecoration(
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
                  LoginTextField(),
                  LoginButton(),
                ]),
              ),
              // LoginButton(),
              // RegisterButtonWidget()
            ],
          )
        ],
      ),
    );
  }
}
