import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/home/home_screen.dart';
import '../tg_ui/tghome/tghome.dart';
import 'regpay.dart';

class UserType extends StatelessWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/logo.png', height: height * 0.6),
            Text(
              'Connecting you with Expert Guides for Unforgettable Experience',
              style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'How do you identify yourself?',
              style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                     
                        // Check if current user has uploaded a picture
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
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Tour Guide'.toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                   
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
           
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Tourist'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  
}
