//import 'package:app_eco/screens/home_screen.dart';
import 'package:app_eco/model/google_auth.dart';
import 'package:app_eco/screens/Bnavigation.dart';
import 'package:app_eco/screens/Home/home_screen.dart';
import 'package:app_eco/screens/Perfil/profile_screen.dart';
import 'package:app_eco/screens/Aunth/registro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginScreen extends StatefulWidget {
  //loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  //controlador de edicion
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
//firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Correo Electronico',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
// campo de passdord  (password)
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Contraseña',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //Boton para Inicio de sesion
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          inicioSesion(emailController.text, passwordController.text);
        },
        child: Text(
          'Iniciar Sesión',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    //Botoón de rgistro
    final registroButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => registroScreen()));
        },
        child: Text(
          'Registrarse',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final socialButtons = Material(
      child: Container(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
                heroTag: null,
                child: Icon(FontAwesomeIcons.google),
                onPressed: () async {
                  User? user =
                      await Authenticator.IniciarSesionGoogle(context: context);
                  print(user?.displayName);
                }),
            FloatingActionButton(
                child: Icon(FontAwesomeIcons.facebook), onPressed: () {}),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Inciar Sesión'),
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
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 45),
                    loginButton,
                    SizedBox(height: 15),
                    registroButton,
                    SizedBox(height: 15),
                    socialButtons,
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//funcion login
  void inicioSesion(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'inicio de sesión correcto'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BNavigattor()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
