import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../domains/entities/category/category_entity.dart';
import '../../data/tools/constants/assets/icons.dart';
import '../../data/tools/constants/language/getx_translation.dart';
import '../../data/tools/extensions/int_extensions.dart';

class MyRatingChip extends StatefulWidget {
  final bool hasHorizontalGap;

  const MyRatingChip({this.hasHorizontalGap = true, super.key});

  @override
  State<MyRatingChip> createState() => _MyRatingChipState();
}

class _MyRatingChipState extends State<MyRatingChip> {
  void selectCategories(List stars, int value) {
    for (int i = 0; i < stars.length; i++) {
      i == value ? stars[i].isSelected = true : stars[i].isSelected = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    for (int i = 0; i < stars.length; i++) {
      i == 0 ? stars[i].isSelected = true : stars[i].isSelected = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            widget.hasHorizontalGap ? 12.gapX() : 0.gapX(),
            ...List.generate(
              stars.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ActionChip(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8,
                  ),
                  backgroundColor: stars[index].isSelected
                      ? KTColors.mainRed
                      : KTColors.white,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  side: const BorderSide(
                    width: 1.7,
                    color: KTColors.mainRed,
                  ),
                  label: Row(
                    children: [
                      SvgPicture.asset(
                        stars[index].isSelected
                            ? KTIcons.starWhite
                            : KTIcons.starRed,
                      ),
                      Text(
                        "  ${stars[index].categoryName}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: stars[index].isSelected
                              ? KTColors.white
                              : KTColors.mainRed,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => selectCategories(stars, index),
                ),
              ),
            ),
            widget.hasHorizontalGap ? 12.gapX() : 0.gapX(),
          ],
        ),
      ),
    );
  }
}

List<CategoryEntity> stars = [
  CategoryEntity(categoryName: AppLocalization().all),
  CategoryEntity(categoryName: "5"),
  CategoryEntity(categoryName: "4"),
  CategoryEntity(categoryName: "3"),
  CategoryEntity(categoryName: "2"),
  CategoryEntity(categoryName: "1"),
];
