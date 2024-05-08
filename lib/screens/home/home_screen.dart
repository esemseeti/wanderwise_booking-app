import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/footer.dart';
import 'components/header_container.dart';
import 'components/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
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
        child: SafeArea(
          child: Column(
            children: [
              //header
              HeaderContainer(),
              SizedBox(height: 10,),
       
        // Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
                    Text(
                      'Explore Top Destinations Here in Alaminos',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue, ),
                    ),
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => Destinations()));
        //               },
        //               child: Text(
        //                 'View All',
        //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
                  

              //body
              BodyContainer(),
              //footer
              SizedBox(
                height: 30,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}