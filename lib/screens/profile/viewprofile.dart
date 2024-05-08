import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../tg_ui/tghome/tghome.dart';
import '../../user_auth/regpay.dart';
import '../home/components/header.dart';
import '../home/components/menu.dart';
import '../home/home_screen.dart';




class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  final currentUser = FirebaseAuth.instance.currentUser;
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            MobMenu(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: kPrimaryColor,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Header(),
              OutlinedButton(
                onPressed: () async {
                  // Check if the current user is a tourist and wants to start as a tour guide
                
                final userDoc = FirebaseFirestore.instance.collection('users').doc(currentUser!.uid);
    final userData = await userDoc.get();

    if (userData.exists && userData.get('profile_picture') != null) {
      // User has uploaded a profile picture, navigate to tghome
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TgHome()));
    } else {
      // No profile picture uploaded, navigate to regpay
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegPay()));
    }
                },
                child: Text('Start as Tour Guide'),
              ),
              OutlinedButton(
                onPressed: () {
                  // Logout functionality
                  FirebaseAuth.instance.signOut().then((value) {
                    setState(() {
                      // Navigate to HomeScreen after logout
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    });
                  });
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}