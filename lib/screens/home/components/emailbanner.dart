import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wanderwiseproject/user_auth/register.dart';
import 'package:wanderwiseproject/user_auth/regpay.dart';

import '../../../constants.dart';


class EmailBanner extends StatelessWidget {
  const EmailBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/pang.jpg",
              height: 200,
              width: 1230,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                AutoSizeText(
                  "WANT TO BE A TOUR GUIDE?",
                  maxLines: 2,
                  minFontSize: 14,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        child:  ElevatedButton(
              onPressed: () {
                           //  Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TRegister()));
                             if (FirebaseAuth.instance.currentUser == null) {
              // If not logged in, show the login screen
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => Register()));
            } else {
              // If logged in, show the profile screen
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => RegPay()));
            }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Register as Tour Guide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                      ),
                    ),
                   
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
