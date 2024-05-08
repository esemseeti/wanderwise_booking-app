import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../constants.dart';
import '../../destinations/ddetails.dart';

class DCard extends StatelessWidget {
  const DCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: 10,
        ),
        Details(
          image: "assets/images/hundred.jpg",
          title: "Hundred Islands",
          description: 'Book your TOUR GUIDE now',
        ),
        Details(
          image: "assets/images/sabangan.jpg",
          title: "Sabangan Falls",
          description: 'Book your TOUR GUIDE now',
        ),
        Details(
          image: "assets/images/bolo.jpg",
          title: "Bolo Beach",
          description: 'Book your TOUR GUIDE now',
        ),
        Details(
          image: "assets/images/cuenco.jpg",
          title: "Cuenco Cave",
          description: 'Book your TOUR GUIDE now',
        ),
         
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.image,
    required this.title,
    required this. description,
  }) : super(key: key);
  final String image, title,description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (c)=> Destinations_Details()));
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: EdgeInsets.all(kPadding / 2),
            width: 300,
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 100,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
               
               AutoSizeText(
                maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                   ),
                  description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
