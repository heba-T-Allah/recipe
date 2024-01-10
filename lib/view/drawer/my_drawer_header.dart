import 'package:flutter/material.dart';

import '../../resources/text_style.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        // border:
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration:
            BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Image.asset("assets/images/1686.jpg"),
          ),
          // SizedBox(width: 10,),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Emma Holmes",
                style: TextStyles.textStyleRegular18Black,
              ),
              // SizedBox(height: 20),
              Text(
                "View Profile",
                style: TextStyles.textStyleRegular10Grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
