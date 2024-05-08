import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants.dart';
import '../../screens/home/home_screen.dart';
import '../tg_header.dart';
import '../tgmenu.dart';

class TgProfile extends StatefulWidget {
  const TgProfile({super.key});

  @override
  State<TgProfile> createState() => _TgProfileState();
}

class _TgProfileState extends State<TgProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: Center(
                child:  Image.asset('assets/images/logo.png')
              ),
            ),
            TgMobMenu()
          ],
        ),
      ),

    body: SingleChildScrollView(
      child:Container(
        width: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      padding: EdgeInsets.all(8.0),
        child: Column(children: [ 
          TgHeader(),
OutlinedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  setState(() {
                     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()), // Pumunta sa home screen matapos ang log-out
    );
                  });
                });
              },
              child: Text('Logout')),
               OutlinedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  setState(() {
                     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()), // Pumunta sa home screen matapos ang log-out
    );
                  });
                });
              },
              child: Text('Start as Tourist')),
        ],
        ),
      )
    ),
    );
  }
}