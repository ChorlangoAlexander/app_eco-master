import 'package:flutter/material.dart';

class seleccionChatScreen extends StatefulWidget {
  seleccionChatScreen({Key? key}) : super(key: key);

  @override
  State<seleccionChatScreen> createState() => _seleccionChatScreenState();
}

class _seleccionChatScreenState extends State<seleccionChatScreen> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Mensajes',
    'Activos',
    'Grupos',
    'Solicitud de mensaje',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Colors.green[400],
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index2) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index2;
                });
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 30.0,
                  ),
                  child: Text(
                    categories[index2],
                    style: TextStyle(
                      color: index2 == selectedIndex
                          ? Colors.white
                          : Colors.white60,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  )),
            );
          }),
    );
  }
}
