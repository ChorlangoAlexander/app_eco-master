import 'package:app_eco/screens/Chat/chat_screen.dart';
import 'package:app_eco/screens/Ubicacion/location_Screem.dart';
import 'package:app_eco/screens/notification_screen.dart';
import 'package:app_eco/screens/Perfil/profile_screen.dart';
import 'package:app_eco/screens/search_screen.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  /*int _selectedTab = 0;
  List<Widget> _screensTab = [
    homeScreen(),
    searchScreen(),
    notificationScreen(),
    profileScreen(),
    chatScreen(),
    locationScreem(),
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('EcoAmigo'),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Icon(Icons.search)),
          ),
          InkWell(
            onTap: () {
              notificationScreen();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Icon(Icons.notifications)),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Historias",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[500]),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 12),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/2169434/pexels-photo-2169434.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Colors.green[300],
              margin: EdgeInsets.symmetric(horizontal: 30),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  buildPostSection(
                      "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=640",
                      "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=940"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPostSection(String urlPost, String urlProfilePhoto) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPostFirstRow(urlProfilePhoto),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(urlPost),
          SizedBox(
            height: 5,
          ),
          Text(
            "3 Likes",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row buildPostFirstRow(String urlProfilePhoto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        profileScreen(url: urlProfilePhoto)));*/
              },
              child: Hero(
                tag: urlProfilePhoto,
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(urlProfilePhoto),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alexander Ruben",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tulcán",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        Icon(Icons.more_vert)
      ],
    );
  }

  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Icon(Icons.favorite,
              size: 35, color: Colors.white.withOpacity(0.7)),
        )
      ],
    );
  }

  Container buildStoryAvatar(String url) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 60,
      width: 60,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.green),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
