import 'package:flutter/material.dart';

import '../../../views/pages/base/main/widgets/my_action_chip.dart';
import '../../../views/widgets/my_button.dart';
import '../../../views/widgets/my_rating_chip.dart';
import '../constants/style/fonts.dart';
import '../constants/style/colors.dart';
import '../constants/language/getx_translation.dart';

abstract class FilterSheets {
  static Future filterSheet(BuildContext context, Size size) {
    final lang = AppLocalization();

    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      elevation: 4,
      useSafeArea: true,
      enableDrag: true,
      builder: (context) {
        categories[0].isSelected = true;
        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.6,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(
                    endIndent: size.width * 0.44,
                    indent: size.width * 0.44,
                    thickness: 3,
                    color: KTColors.border,
                  ),
                  Align(
                    child: Text(
                      lang.filter,
                      style: ktBodyLargeStyle,
                    ),
                  ),
                  Divider(
                    endIndent: size.width * 0.043,
                    indent: size.width * 0.043,
                    thickness: 1,
                    color: KTColors.border,
                  ),
                  title(lang.category),
                  const MyActionChip(),
                  title(lang.price),
                  const MyRangeSlider(),
                  title(lang.rating),
                  const MyRatingChip(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        onPressed: () => Navigator.pop(context),
                        color: KTColors.secondaryLightBlue,
                        text: lang.reset,
                        textColor: KTColors.mainRed,
                        size: const Size(160, 50),
                      ),
                      MyButton(
                        onPressed: () => Navigator.pop(context),
                        color: KTColors.mainRed,
                        text: lang.filter,
                        size: const Size(160, 50),
                        elevation: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget title(String text) => Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        text,
        style: ktTitleStyle.copyWith(fontSize: 18),
      ),
    );

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({super.key});

  @override
  State<MyRangeSlider> createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> {
  RangeValues values = const RangeValues(2, 6);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      "\$${values.start.toInt() * 10}",
      "\$${values.end.toInt() * 10}",
    );

    return RangeSlider(
      activeColor: KTColors.mainRed,
      inactiveColor: KTColors.border,
      min: 0,
      max: 12,
      divisions: 12,
      overlayColor: const MaterialStatePropertyAll(KTColors.mainRed),
      values: values,
      labels: labels,
      onChanged: (newValues) {
        values = newValues;
        setState(() {});
      },
    );
  }
}
