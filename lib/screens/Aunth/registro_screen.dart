import 'package:app_eco/model/user_model.dart';
import 'package:app_eco/screens/Home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registroScreen extends StatefulWidget {
  registroScreen({Key? key}) : super(key: key);

  @override
  State<registroScreen> createState() => _registroScreenState();
}

class _registroScreenState extends State<registroScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  //controladores
  final nombresEditingController = new TextEditingController();
  final apellidosEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmarPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nombresField = TextFormField(
      autofocus: false,
      controller: nombresEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ('El nombre no puede estar vacío');
        }
        if (!regex.hasMatch(value)) {
          return ('Introduzca una nombre válida (mínimo. 3 caracteres)');
        }
        return null;
      },
      onSaved: (value) {
        nombresEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Escriba sus nombres',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
//campo apellidos
    final apellidosField = TextFormField(
      autofocus: false,
      controller: apellidosEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Apellidos no puede estar vacío');
        }

        return null;
      },
      onSaved: (value) {
        apellidosEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Escriba sus apellidos',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //campo correo
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Por favor ingrese su correo electrónico');
        }
        // validación de correo electrónico
        if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+.-]+.[a-z]')
            .hasMatch(value)) {
          return ('Introduzca un correo electrónico válido');
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Ingrese su correo electronico',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //campo contraseña
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('La contraseña es requerida para el ingreso');
        }
        if (!regex.hasMatch(value)) {
          return ('Introduzca una contraseña válida (mínimo. 6 caracteres)');
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Ingrese una contraseña',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //campo confirmar contraseña
    final confirmarpassordField = TextFormField(
      autofocus: false,
      controller: confirmarPasswordEditingController,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      validator: (value) {
        if (confirmarPasswordEditingController.text !=
            passwordEditingController.text) {
          return 'La contraseña no coincide';
        }
        return null;
      },
      onSaved: (value) {
        confirmarPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirme su contraseña',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    //boton registrar
    final registrarButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          registro(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          'Registrar',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Regitro de Datos'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/app.jpg',
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 25),
                    nombresField,
                    SizedBox(height: 25),
                    apellidosField,
                    SizedBox(height: 25),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    confirmarpassordField,
                    SizedBox(height: 25),
                    registrarButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registro(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireStore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.massage);
      });
    }
  }

  postDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.userid = user.uid;
    userModel.nombres = nombresEditingController.text;
    userModel.apellidos = apellidosEditingController.text;
    userModel.password = passwordEditingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.tomMap());
    Fluttertoast.showToast(msg: 'La cuenta se creo correctamente');
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => homeScreen()),
        (route) => false);
  }
}
