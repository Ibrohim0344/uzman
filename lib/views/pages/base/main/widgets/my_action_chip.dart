import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../domains/entities/category/category_entity.dart';

class MyActionChip extends StatefulWidget {
  final AppLocalizations lang;

  const MyActionChip(this.lang, {super.key});

  @override
  State<MyActionChip> createState() => _MyActionChipState();
}

class _MyActionChipState extends State<MyActionChip> {
  List<CategoryEntity> categories = [];

  void selectCategories(List categories, int value) {
    for (int i = 0; i < categories.length; i++) {
      i == value
          ? categories[i].isSelected = true
          : categories[i].isSelected = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    categories = workCategories(widget.lang);
    categories.first.isSelected = true;
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
            const SizedBox(width: 12),
            ...List.generate(
              categories.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: ActionChip(
                  shape: const StadiumBorder(),
                  backgroundColor: categories[index].isSelected
                      ? KTColors.mainRed
                      : KTColors.white,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  side: const BorderSide(
                    width: 1.7,
                    color: KTColors.mainRed,
                  ),
                  label: Text(
                    categories[index].categoryName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: categories[index].isSelected
                          ? KTColors.white
                          : KTColors.black,
                    ),
                  ),
                  onPressed: () => selectCategories(categories, index),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

List<CategoryEntity> workCategories(AppLocalizations lang) => [
      CategoryEntity(categoryName: lang.all),
      CategoryEntity(categoryName: lang.cleaning),
      CategoryEntity(categoryName: lang.repair),
      CategoryEntity(categoryName: lang.paint),
      CategoryEntity(categoryName: lang.laundry),
      CategoryEntity(categoryName: lang.furniture),
      CategoryEntity(categoryName: lang.plumbing),
    ];
