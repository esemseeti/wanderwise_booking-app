import 'package:flutter/material.dart';

import '../../constants.dart';
import '../home/components/header.dart';
import '../home/components/menu.dart';

class Destinations extends StatelessWidget {
  const Destinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: Center(
                child:  Image.asset('assets/images/logo.png')
              ),
            ),
            MobMenu()
          ],
        ),
      ),

    body: SingleChildScrollView(
      child:Container(
        width: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      padding: EdgeInsets.all(8.0),
        child: Column(children: [ 
          Header(),
          
Card(),
        ],
        ),
      )
    ),
    );
  }
}