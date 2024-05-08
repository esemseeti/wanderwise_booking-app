import 'package:flutter/material.dart';

import '../tg_footer.dart';
import '../tg_headercontainer.dart';
import '../tgmenu.dart';
class TgHome extends StatelessWidget {
  const TgHome({super.key});

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
            TgMobMenu()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //header
             TgHeaderContainer(),
              SizedBox(height: 10,),
        //        Row(
        //   children:[Text('Explore Destinations',
        //    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
        //    color: kSecondaryColor),),
        //   Spacer(),
        //   GestureDetector(
        //     onTap: (() {
        //            Navigator.of(context).push(MaterialPageRoute(builder: (c)=> Destinations()));
        //     }),
        //     child: Text('View All',
        //      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
        //   )]
        // ),
              //body
            //  BodyContainer(),
              //footer
              SizedBox(
                height: 30,
              ),
              
             TgFooter(),
              //now we make our website responsive
            ],
          ),
        ),
      ),
    );
  }
}