import 'package:app_eco/model/user_model.dart';
import 'package:app_eco/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('EcoAmigo'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Column(children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                                'https://bysperfeccionoral.com/wp-content/uploads/2020/01/136-1366211_group-of-10-guys-login-user-icon-png.jpg')
                                ),
                                
                      ],
                    )
                  ]),
                ),
              )
            ]),
      )),
    );
  }
}
