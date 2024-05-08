import 'package:flutter/material.dart';
import 'package:wanderwiseproject/model.dart/tg_model.dart';
import 'package:wanderwiseproject/screens/home/components/dcard.dart';
import 'package:wanderwiseproject/screens/home/components/tg.dart';

import '../../../constants.dart';
import '../../../model.dart/responsive.dart';
import '../../destinations/destinations.dart';
import '../../tg_page/tourguides.dart';
import 'emailbanner.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kPadding),
      constraints: BoxConstraints(maxWidth: kMaxWidth),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DCard()),
          
          Column(

            children: [
               ElevatedButton(
            
              onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (c)=> Destinations()));
              },
              style: ElevatedButton.styleFrom(
                
               // padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'View All',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
              SizedBox(
                height: 20,
              ),
              Text('Featured Tour Guides',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
              color: kSecondaryColor),),
              
             
          // GestureDetector(
          //   onTap: (() {
          //          Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TourGuides()));
          //   }),
          //   child: Text('View All',
          //    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
          // )
            ],
          ),
      
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
          ElevatedButton(
            
              onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (c)=> TourGuide()));
              },
              style: ElevatedButton.styleFrom(
                
               // padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'View All',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
              
          SizedBox(
            height: 40,
          ),
          EmailBanner(),
        ],
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
