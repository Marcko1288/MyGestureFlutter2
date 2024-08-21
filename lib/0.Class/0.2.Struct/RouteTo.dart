import 'package:flutter/material.dart';
import 'package:mygesture/1.View/1.1.Login/LoginView.dart';
import 'package:mygesture/1.View/1.3.Cash/CashView.dart';
import 'package:mygesture/1.View/DefaultView.dart';

class RouteElement {
  final String title;
  late dynamic state;
  late dynamic element;

  RouteElement(this.title, this.state, this.element);
}

Route<dynamic> routeTo(RouteSettings settings) {
  var args = settings.arguments as RouteElement;

  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginView());
    //case '/reset_password':
    //  return MaterialPageRoute(builder: (context) => ResetPasswordView());
    //case '/register':
    //  return MaterialPageRoute(builder: (context) => RegisterView());
    case '/cash':
      return MaterialPageRoute(builder: (context) => CashView());
    // case '/modify_cash':
    //   var element = args.element is Cash ? args.element as Cash : null;
    //   var state = args.state == null ? null : state;
    //   return MaterialPageRoute(builder: (context) => Add_CashView());

    default:
      return MaterialPageRoute(builder: (context) => DefaultView());
  }
}
