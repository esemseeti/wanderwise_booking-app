import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../model.dart/responsive.dart';
import 'tgmenu.dart';

class TgHeader extends StatelessWidget {
  const TgHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        // it  display only on mobile and tab
        //not working

        if (!Responsive.isDesktop(context))
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu))),
        Text(
          "WanderWise",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: kSecondaryColor),
        ),
        Spacer(),
        //menu
        if (Responsive.isDesktop(context)) TgHeaderWebMenu(),
        Spacer(),

        // _size.width > 400
        //     ? Expanded(
        //         child: Container(
        //           padding: EdgeInsets.only(left: 10, right: 10),
        //           height: 50,
        //           width: 50,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             border: Border.all(color: Colors.grey.withOpacity(0.3)),
        //           ),
        //           child: TextFormField(
        //             decoration: InputDecoration(
        //                 prefixIcon: Icon(
        //                   Icons.search,
        //                   color: Colors.black,
        //                 ),
        //                 hintText: "Search",
        //                 hintStyle: TextStyle(
        //                     fontWeight: FontWeight.w600, fontSize: 14),
        //                 focusedBorder:
        //                     UnderlineInputBorder(borderSide: BorderSide.none),
        //                 enabledBorder:
        //                     UnderlineInputBorder(borderSide: BorderSide.none)),
        //           ),
        //         ),
        //       )
        //     : Container(
        //         padding: EdgeInsets.only(left: 10, right: 10),
        //         height: 50,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           border: Border.all(color: Colors.grey.withOpacity(0.3)),
        //         ),
        //         child: Icon(Icons.search)),
        // SizedBox(
        //   width: 10,
        // ),
        // Container(
        //   height: 45,
        //   width: 45,
        //   decoration: BoxDecoration(
        //     color: kSecondaryColor,
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        //   child: Icon(
        //     Icons.people_alt,
        //     color: Colors.white,
        //     size: 22,
        //   ),
        // )
      ],
    );
  }
}
