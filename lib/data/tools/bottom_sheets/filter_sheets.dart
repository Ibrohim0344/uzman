import 'package:flutter/material.dart';

import '../../../views/pages/base/main/widgets/my_action_chip.dart';
import '../../../views/pages/base/profile/security/widgets/security_button.dart';
import '../../../views/widgets/main_button.dart';
import '../../../views/widgets/my_rating_chip.dart';
import '../constants/l10n/app_localizations.dart';
import '../constants/style/fonts.dart';
import '../constants/style/colors.dart';

abstract class FilterSheets {
  static Future filterSheet(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);

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
                  MyActionChip(lang),
                  title(lang.price),
                  const MyRangeSlider(),
                  title(lang.rating),
                  MyRatingChip(lang),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryButton(
                        lang.reset,
                        size.width / 2 - 24,
                        onPressed: () => Navigator.pop(context),
                      ),
                      MainButton(
                        lang.filter,
                        size.width / 2 - 24,
                        hasElevation: true,
                        fontSize: 15,
                        onPressed: () => Navigator.pop(context),
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
