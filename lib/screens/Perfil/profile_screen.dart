import 'package:app_eco/model/user_model.dart';
import 'package:app_eco/screens/Perfil/edit_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profScreen extends StatefulWidget {
  profScreen({Key? key}) : super(key: key);

  @override
  State<profScreen> createState() => _profScreenState();
}

class _profScreenState extends State<profScreen> {
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

  countColum(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  profileButton() {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => editProfileScreen(),
            ),
          );
        },
        child: Container(
          width: 200.0,
          height: 26,
          child: Text(
            'Editar Perfil',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Perfil')),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        'assets/3.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              countColum('Publicaciones', 0),
                              countColum('Segidores', 0),
                              countColum('Seguidos', 0),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileButton(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    '${usuarioLogeado.nombres} ${usuarioLogeado.apellidos}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    '${usuarioLogeado.email}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
