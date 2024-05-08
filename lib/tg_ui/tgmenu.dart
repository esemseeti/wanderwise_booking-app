import 'package:flutter/material.dart';

import '../constants.dart';
import 'tghome/tghome.dart';
import 'tgprofile/tgprofile.dart';
class TgHeaderWebMenu extends StatelessWidget {
  const TgHeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TgHeaderMenu(
          press: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TgHome()));
          },
          title: "Home",
        ),
        SizedBox(
          width: kPadding,
        ),
        TgHeaderMenu(
          press: () {

          },
          title: "Appointments",
        ),
        SizedBox(
          width: kPadding,
        ),
        // TgHeaderMenu(
        //   press: () {
  
        //   },
        //   title: "Tour Guides",
        // ),
        SizedBox(
          width: kPadding,
        ),
        TgHeaderMenu(
          press: () {
   Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TgProfile()));
          },
          title: "Profile",
        ),
        SizedBox(
          width: kPadding,
        ),
       
      ],
    );
  }
}

class TgMobFooterMenu extends StatelessWidget {
  const TgMobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TgHeaderMenu(
          press: () {

          },
          title: "Home",
        ),
        SizedBox(
          width: kPadding,
        ),
        TgHeaderMenu(
          press: () {

          },
          title: "Appointments",
        ),
        SizedBox(
          width: kPadding,
        ),
        // TgHeaderMenu(
        //   press: () {
 
        //   },
        //   title: "Tour Guides",
        // ),
        SizedBox(
          width: kPadding,
        ),
        TgHeaderMenu(
          press: () {
 Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TgProfile()));
          },
          title: "Profile",
        ),
        SizedBox(
          width: kPadding,
        ),
       
      ],
    );
  }
}

class TgHeaderMenu extends StatelessWidget {
  const TgHeaderMenu({
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

class TgMobMenu extends StatefulWidget {
  const TgMobMenu({Key? key}) : super(key: key);

  @override
  _TgMobMenuState createState() => _TgMobMenuState();
}

class _TgMobMenuState extends State<TgMobMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TgHeaderMenu(
            press: () {
 
            },
            title: "Home",
          ),
          SizedBox(
            height: kPadding,
          ),
          TgHeaderMenu(
            press: () {
  
            },
            title: "Appointments",
          ),
          SizedBox(
            height: kPadding,
          ),
          // TgHeaderMenu(
          //   press: () {
 
          //   },
          //   title: "Tour Guides",
          // ),
          SizedBox(
            height: kPadding,
          ),
          TgHeaderMenu(
            press: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TgProfile()));
            },
            title: "Profile",
          ),
          SizedBox(
            height: kPadding,
          ),
         
        ],
      ),
    );
  }
}
