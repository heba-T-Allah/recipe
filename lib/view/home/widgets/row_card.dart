import 'package:flutter/material.dart';
import 'package:registration/view/home/widgets/my_rating_bar.dart';
import 'package:registration/view/home/widgets/prep_time_and_serving.dart';
import '../../../model/recipe.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/text_style.dart';
import '../../../resources/values_manager.dart';
import 'my_fav_icon.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    super.key,
    required this.recipeList,
  });

  final List<Recipe> recipeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        itemCount: recipeList.length,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Positioned(
                child: SizedBox(
                  child: Card(
                      margin: const EdgeInsets.only(right: AppMargin.m60),
                      color: ColorManager.backgroundGreyColor,
                      // elevation: 2,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s30),
                          borderSide: BorderSide.none),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .55,

                        child: Padding(
                          padding: const EdgeInsets.all( AppPadding.p20),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MyFavIcon(
                                  recipeList: recipeList, index: index),
                              const SizedBox(
                                width: AppSize.s90,
                                height: AppSize.s90,
                              ),
                              Text(
                                recipeList[index].mealType!,
                                style: TextStyles.textStyleMedium10Blue,
                              ),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(recipeList[index].title!,
                                    style: TextStyles.textStyleMedium14Black),
                              ),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              MyRatingBar(
                                  recipeList: recipeList, index: index),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              Text(
                                "${recipeList[index].calories!} Calories",
                                style: TextStyles.textStyleRegular10Orange,
                              ),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              PrepTimeAndServing(
                                  recipeList: recipeList, index: index)
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Positioned(
                right: -10,
                top: -20,
                child: Image.asset(
                  recipeList[index].image!,
                  width: AppSize.s150,
                  height: AppSize.s150,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
