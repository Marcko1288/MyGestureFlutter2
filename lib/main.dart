import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.1.Element/Master.dart';
import 'X1.View/1.1.Login/LoginView.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Master.standard())],
      child: MaterialApp(
        // Application name
        title: 'MyGesture',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          // useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
        // A widget which will be started on application startup
        home: LoginView(),
      ),
    );
  }
}
