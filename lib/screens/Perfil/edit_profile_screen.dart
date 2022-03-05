import 'package:app_eco/screens/Aunth/login_screen.dart';
import 'package:flutter/material.dart';

class editProfileScreen extends StatefulWidget {
  editProfileScreen({Key? key}) : super(key: key);

  @override
  State<editProfileScreen> createState() => _editProfileScreenState();
}

class _editProfileScreenState extends State<editProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Editar Perfil',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 2),
        child: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => loginScreen(),
                ),
              );
            },
            child: Container(
              width: 250,
              height: 26,
              child: Text(
                'Cerra Sesión',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
