import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../widgets/category_widget.dart';

class AllServicesPage extends StatefulWidget {
  const AllServicesPage({super.key});

  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage> {
  List<String> icons = [
    KTIcons.clean,
    KTIcons.repair,
    KTIcons.paint,
    KTIcons.laundry,
    KTIcons.furniture,
    KTIcons.plumbing,
    KTIcons.delivery,
    KTIcons.beauty,
    KTIcons.acRepair,
    KTIcons.car,
    KTIcons.electronics,
    KTIcons.massage,
    KTIcons.menSalon,
  ];

  List<String> texts = [];

  List<Color> colors = [
    KTColors.mainRed,
    KTColors.orange,
    KTColors.blue,
    KTColors.yellow,
    KTColors.red,
    KTColors.green,
    KTColors.lightBlue,
    KTColors.purple,
    KTColors.green,
    KTColors.blue,
    KTColors.orange,
    KTColors.mainRed,
    KTColors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();
    texts = [
      lang.cleaning,
      lang.repair,
      lang.paint,
      lang.laundry,
      lang.furniture,
      lang.plumbing,
      lang.delivery,
      lang.beauty,
      lang.acRepair,
      lang.transport,
      lang.electronics,
      lang.massage,
      lang.menSalon,
    ];

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        leading: const BackButton(),
        title: Text(lang.allServices),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) => SizedBox(
              width: index == icons.length - 1 ? null : 80,
              child: CategoryWidget(
                category: icons[index],
                text: texts[index],
                bgColor: colors[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
