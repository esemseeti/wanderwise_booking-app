import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class BannerSection extends StatelessWidget {
  const BannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: AboutSection(),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
            ],
          ),
        )
      ],
    );
  }
}

class MobBanner extends StatefulWidget {
  const MobBanner({Key? key}) : super(key: key);

  @override
  _MobBannerState createState() => _MobBannerState();
}

class _MobBannerState extends State<MobBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 250,
              width: 250,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        AboutSection(),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        //it will adjust its size according to screeen
        AutoSizeText(
          "Welcome, Travelers!",
          maxLines: 1,
          style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        AutoSizeText(
          "Connect with travelers looking for exactly the kind of experience you offer by signing up today.",
          maxLines: 1,
          style: TextStyle(
            fontSize: 56,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
         '''Discover amazing destinations and uncover hidden gems
          personalized just for you! From cultural insights to off-the-beaten-path excursions,
           each tour guide on WanderWise
           is handpicked to ensure you have an enriching and authentic travel experience.
''',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
       
      ],
    );
  }
}
