import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model.dart/tg_model.dart';

class TourGuides extends StatelessWidget {
  const TourGuides({
    Key? key,
    required this.tourguide,
    required this.press,
  }) : super(key: key);
  final Tg tourguide;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding / 2),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
