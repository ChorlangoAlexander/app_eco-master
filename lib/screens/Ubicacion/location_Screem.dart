import 'package:flutter/material.dart';

class locationScreem extends StatefulWidget {
  locationScreem({Key? key}) : super(key: key);

  @override
  State<locationScreem> createState() => _locationScreemState();
}

class _locationScreemState extends State<locationScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Mapa'), centerTitle: true, actions: [
      InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Icon(Icons.settings)),
      ),
    ]));
  }
}
