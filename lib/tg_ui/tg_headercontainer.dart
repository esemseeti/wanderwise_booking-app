import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../model.dart/responsive.dart';
import 'tg_banner_section.dart';
import 'tg_header.dart';

class TgHeaderContainer extends StatelessWidget {
  const TgHeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(kPadding),
            constraints: BoxConstraints(maxWidth: kMaxWidth),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TgHeader(),
                SizedBox(
                  height: 20,
                ),
                Responsive.isDesktop(context) ? TgBannerSection() : TgMobBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
