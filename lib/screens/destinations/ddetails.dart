import 'package:flutter/material.dart';
import 'package:wanderwiseproject/model.dart/tg_model.dart';

import '../../constants.dart';
import '../../model.dart/responsive.dart';
import '../home/components/footer.dart';
import '../home/components/header.dart';
import '../home/components/menu.dart';
import '../home/components/tg.dart';

class Destinations_Details extends StatelessWidget {
  const Destinations_Details({super.key});

  @override
  Widget build(BuildContext context) {
     final Size _size = MediaQuery.of(context).size;
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

           Responsive(
            desktop: ProductCard(
              crossAxiscount: _size.width < 650 ? 2 : 3,
              aspectRatio: _size.width < 650 ? 0.85 : 1.1,
            ),
            tablet: ProductCard(
              crossAxiscount: _size.width < 825 ? 2 : 3,
              aspectRatio: _size.width < 825 ? 0.85 : 1.1,
            ),
            mobile: ProductCard(
              crossAxiscount: _size.width < 690 ? 2 : 3,
              aspectRatio: _size.width < 560 ? 0.85 : 1.1,
            ),
          ),
            SizedBox(
                height: 30,
              ),
              
              Footer(),

        ],
        ),
      )
    ),
    );
  }
}
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.crossAxiscount = 3,
    this.aspectRatio = 1.1,
  }) : super(key: key);
  final int crossAxiscount;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxiscount,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) => TourGuides(
        press: () {},
        tourguide: tourguides[index],
      ),
      itemCount: tourguides.length,
    );
  }
}