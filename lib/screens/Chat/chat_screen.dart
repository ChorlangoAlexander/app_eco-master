import 'package:app_eco/screens/Chat/categoriaScreen.dart';
import 'package:flutter/material.dart';

class chatScreen extends StatefulWidget {
  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
        //elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          seleccionChatScreen(),
        ],
      ),
    );
  }
}
