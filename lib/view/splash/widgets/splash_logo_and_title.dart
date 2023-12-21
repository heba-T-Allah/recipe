
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/text_style.dart';
import '../../../resources/values_manager.dart';

class SplashLogoAndTitle extends StatelessWidget {
  const SplashLogoAndTitle({
    super.key,
    required this.height,
    required this.width,
    required this.mainAxisAlignment,
    required this.textTitle

  });

  final double height;
  final double width;
  final MainAxisAlignment mainAxisAlignment;
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.background),
              fit: BoxFit.fill,
            )),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/images/logo2.png",
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              textTitle,
              style:
              TextStyles.textStyleRegular16Grey.copyWith(height: 1.5),
            ),
          ],
        ));
  }
}
