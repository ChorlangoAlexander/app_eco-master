import 'package:app_eco/screens/Bnavigation.dart';
import 'package:app_eco/screens/Home/home_screen.dart';
import 'package:app_eco/screens/Perfil/profile_screen.dart';
import 'package:app_eco/screens/Aunth/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BNavigattor(),
    );
  }
}
