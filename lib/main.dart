import 'package:flutter/material.dart';
import 'package:mygesture/9.Library/master.dart';
import 'package:mygesture/9.Library/login.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('it', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Inizializza la localizzazione per 'it'
  runApp(MyApp());
}

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
          primaryColor: Colors.orange,
        ),
        // A widget which will be started on application startup
        home: LoginView(),
      ),
    );
  }
}
