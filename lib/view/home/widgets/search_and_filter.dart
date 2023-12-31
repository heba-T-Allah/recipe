
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/text_style.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 8,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: ColorManager.backgroundGreyColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: AppStrings.search,
                    hintStyle:
                    TextStyles.textStyleRegular13Grey,
                  ),
                ),
              ),
            )),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            width: 30,
            decoration: BoxDecoration(
              color: ColorManager.backgroundGreyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                ImageAssets.filterIcon,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

