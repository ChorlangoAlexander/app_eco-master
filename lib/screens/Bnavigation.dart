import 'package:app_eco/screens/Chat/chat_screen.dart';
import 'package:app_eco/screens/Home/home_screen.dart';
import 'package:app_eco/screens/Ubicacion/location_Screem.dart';
import 'package:app_eco/screens/notification_screen.dart';
import 'package:app_eco/screens/Perfil/profile_screen.dart';
import 'package:app_eco/screens/search_screen.dart';
import 'package:flutter/material.dart';

class BNavigattor extends StatefulWidget {
  BNavigattor({Key? key}) : super(key: key);

  @override
  State<BNavigattor> createState() => _BNavigattorState();
}

class _BNavigattorState extends State<BNavigattor> {
  int _paginaActual = 0;
  List<Widget> _paginas = [
    //BNavigattor(),
    homeScreen(),
    chatScreen(),
    notificationScreen(),
    locationScreem(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bara de navegacion
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: (Colors.grey[350]),
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin), label: 'Ubicacion'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
