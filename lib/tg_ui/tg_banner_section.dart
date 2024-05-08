import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class TgBannerSection extends StatelessWidget {
  const TgBannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TgAboutSection(),
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

class TgMobBanner extends StatefulWidget {
  const TgMobBanner({Key? key}) : super(key: key);

  @override
  _TgMobBannerState createState() => _TgMobBannerState();
}

class _TgMobBannerState extends State<TgMobBanner> {
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
        TgAboutSection(),
      ],
    );
  }
}

class TgAboutSection extends StatelessWidget {
  const TgAboutSection({
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
          "Welcome, Tour Guides!",
          maxLines: 1,
          style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        AutoSizeText(
          "Twinkle twinkle little stars, how i wonder where you are up above the world so high",
          maxLines: 1,
          style: TextStyle(
            fontSize: 56,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
         '''gitgjsnvwoiwtugjgjvnjfnjfbvnfjvnjdndjfnfebbdmfhorowitughdhsiworob
         jdjjjvnvngjbgjfjdieotphpwwkcmvncmxpseitgnvckdfvnnknwfwjrhriejiifivns
         wwfvjjwjwnenfuegurrnveunurrusndwnunvnffnodofn
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
