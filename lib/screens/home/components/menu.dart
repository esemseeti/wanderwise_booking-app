import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wanderwiseproject/user_auth/login.dart';
import 'package:wanderwiseproject/user_auth/regpay.dart';
import '../../../constants.dart';
import '../../../tg_ui/tghome/tghome.dart';
import '../../destinations/destinations.dart';
import '../../profile/appointment.dart';
import '../../profile/viewprofile.dart';
import '../../tg_page/tourguides.dart';
import '../home_screen.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderMenu(
          press: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));
          },
          title: "Home",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => Destinations()));
          },
          title: "Destinations",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => TourGuide()));
          },
          title: "Tour Guides",
        ),
        SizedBox(
          width: kPadding,
        ),
       FirebaseAuth.instance.currentUser == null
           ?
             HeaderMenu(
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => LogIn()));
                },
                title: 
                "Sign In",
              )
            : PopupMenuButton<String>(
                icon: Icon(Icons.person),
                onSelected: (value) {
                  if (value == 'view_profile') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) => ViewProfile()));
                  } else if (value == 'appointments') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) => Appointment()));
                  } else if (value == 'logout') {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));
                  } else if (value == 'start_tour_guide') {
                    final currentUser = FirebaseAuth.instance.currentUser;
                  if (currentUser != null) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUser.uid)
                        .get()
                        .then((DocumentSnapshot<Map<String, dynamic>> snapshot) {
                      if (snapshot.exists) {
                        String? userType = snapshot.data()?['user_type'];
                        if (userType == 'tour_guide') {
                          // User already has a tour guide account, navigate to TgHome
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => TgHome()),
                          );
                        } else {
                          // User is a tourist, navigate to RegPay for tour guide registration
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegPay()),
                          );
                        }
                      } else {
                        // User document does not exist, navigate to RegPay for tour guide registration
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegPay()),
                        );
                      }
                    });
                  }
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'view_profile',
                    child: Text('View Profile'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'appointments',
                    child: Text('Appointments'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'start_tour_guide',
                    child: Text('Start as a Tour Guide'),
                  ),
                ],
              ),
      ],
    );
  }
}


class MobFooterMenu extends StatelessWidget {
  const MobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        HeaderMenu(
          press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (c)=> HomeScreen()));
          },
          title: "Home",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (c)=> Destinations()));
          },
          title: "Destinations",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TourGuide()));
          },
          title: "Tour Guides",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            //  if (FirebaseAuth.instance.currentUser == null) {
            //   // If not logged in, show the login screen
            //   Navigator.of(context).push(MaterialPageRoute(builder: (c) => TLogIn()));
            // } else {
            //   // If logged in, show the profile screen
            //   Navigator.of(context).push(MaterialPageRoute(builder: (c) => PTourist()));
            // }
          },
          title:
          FirebaseAuth.instance.currentUser == null ? "Sign In" : 
          "Profile",
        ),
        SizedBox(
          width: kPadding,
        ),
       
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}

class MobMenu extends StatefulWidget {
  const MobMenu({Key? key}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderMenu(
            press: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c)=> HomeScreen()));
            },
            title: "Home",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c)=> Destinations()));
            },
            title: "Destinations",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TourGuide()));
            },
            title: "Tour Guides",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {
                if (FirebaseAuth.instance.currentUser == null) {
              // If not logged in, show the login screen
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => LogIn()));
            } else {
              // If logged in, show the profile screen
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => ViewProfile()));
            }
            },
            title: 
            FirebaseAuth.instance.currentUser == null ? "Sign In" :
             "Profile",
          ),
          SizedBox(
            height: kPadding,
          ),
         
        ],
      ),
    );
  }
}
