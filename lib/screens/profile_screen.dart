import 'package:app_eco/model/user_model.dart';
import 'package:app_eco/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel usuarioLogeado = UserModel();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.usuarioLogeado = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset(
                  'assets/cont.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'Bienvenido',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('${usuarioLogeado.nombres} ${usuarioLogeado.apellidos}',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text('${usuarioLogeado.email}',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text('Cerrar Sesión'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => loginScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> cerrarSesion(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => loginScreen()));
}
