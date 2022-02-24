import 'package:app_eco/screens/Home/home_screen.dart';
import 'package:app_eco/screens/Aunth/login_screen.dart';
import 'package:flutter/material.dart';

class welcomeScreen extends StatefulWidget {
  welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final welcomeButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => loginScreen()),
          );
        },
        child: Text(
          'Siguiente',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('EcoAmigo'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/app.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Bienvenido a EcoAmigo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '¿Estas listo para cambiar el mundo?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 100),
                  welcomeButton,
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
