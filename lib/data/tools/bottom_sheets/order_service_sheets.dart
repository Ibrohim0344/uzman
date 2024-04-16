import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../views/pages/base/base_page.dart';
import '../../../views/pages/base/main/widgets/category_widget.dart';
import '../../../views/pages/base/main/widgets/my_search_field.dart';
import '../../../views/pages/base/profile/security/widgets/security_button.dart';
import '../../../views/widgets/main_button.dart';
import '../../../views/widgets/map/google_map.dart';
import '../constants/assets/icons.dart';
import '../constants/l10n/app_localizations.dart';
import '../constants/style/fonts.dart';
import '../constants/style/colors.dart';
import '../extensions/int_extensions.dart';

abstract class OrderServiceSheets {
  static Future selectServiceCategory(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);
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

    List<String> texts = [
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
            height: size.height * 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.gapY(),
                  ...orderServiceTitle(context, size, lang),
                  Wrap(
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
                          onTap: () => whatIsNeeded(context, size),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future whatIsNeeded(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);
    List<String> services = [
      "Baxtsiz hodisa yuz berganda tez yordam",
      "Kanalizatsiya tozalash",
      "Blokni tozalash",
      "Oqishlarni tuzatish",
      "Santexnika ta’mirlash",
      "Santexnika o’rnatish yoki alamashtirish",
      "Santexnikani demontaj qilish",
      "Kanalizatsiya o’rnatish",
      "Santexnika ta’mirlash",
      "Suv ta’minoti tizimlarini o’rnatish",
      "Isitish ishlari",
      "Santexnikning masofaviy maslahati",
      "To’liq vaqtda usta",
    ];
    List<String> values = List.generate(13, (index) => index.toString());
    String groupValue = "";

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
        groupValue = values.first;

        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.gapY(),
                  ...orderServiceTitle(context, size, lang),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        StatefulBuilder(builder: (context, StateSetter state) {
                          return ListView(
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Text(
                                lang.whatDoYouNeed,
                                textAlign: TextAlign.center,
                                style: ktBodyMediumStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...List.generate(
                                services.length,
                                (index) => RadioListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity:
                                      const VisualDensity(vertical: -3),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    services[index],
                                    style: ktRegularStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: values[index],
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value!;
                                    state(() {});
                                  },
                                ),
                              ),
                              80.gapY(),
                            ],
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: MainButton(
                            lang.next,
                            size.width,
                            onPressed: () => aboutTask(context, size),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future aboutTask(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);
    List<String> problems = [
      "Quvurlar, quvurlar ulanishi",
      "Hojatxona",
      "Lavabo",
      "Vanna",
      "Dush kabinasi",
      "Sochiq panjarasi",
      "Ko’taruvchi",
      "Bilmayman",
      "Boshqa",
    ];
    List<String> values = List.generate(9, (index) => index.toString());
    String groupValue = "";

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
        groupValue = values.first;

        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.gapY(),
                  ...orderServiceTitle(context, size, lang),
                  Expanded(
                    child:
                        StatefulBuilder(builder: (context, StateSetter state) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView(
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Text(
                                lang.whereIsProblem,
                                textAlign: TextAlign.center,
                                style: ktBodyMediumStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...List.generate(
                                problems.length,
                                (index) => RadioListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity:
                                      const VisualDensity(vertical: -3),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    problems[index],
                                    style: ktRegularStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: values[index],
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value!;
                                    state(() {});
                                  },
                                ),
                              ),
                              80.gapY(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SecondaryButton(
                                  lang.back,
                                  size.width / 2 - 24,
                                  onPressed: () => Navigator.pop(context),
                                ),
                                MainButton(
                                  lang.next,
                                  size.width / 2 - 24,
                                  hasElevation: true,
                                  fontSize: 15,
                                  onPressed: () => whatHappened(context, size),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future whatHappened(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);
    List<String> problems = [
      "Oqim",
      "Blokirovka",
      "Boshqa",
    ];
    List<String> values = List.generate(3, (index) => index.toString());
    String groupValue = "";

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
        groupValue = values.first;

        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.gapY(),
                  ...orderServiceTitle(context, size, lang),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        StatefulBuilder(builder: (context, StateSetter state) {
                          return ListView(
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Text(
                                lang.whereIsProblem,
                                textAlign: TextAlign.center,
                                style: ktBodyMediumStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...List.generate(
                                problems.length,
                                (index) => RadioListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity:
                                      const VisualDensity(vertical: -3),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    problems[index],
                                    style: ktRegularStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: values[index],
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value!;
                                    state(() {});
                                  },
                                ),
                              ),
                              80.gapY(),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SecondaryButton(
                          lang.back,
                          size.width / 2 - 24,
                          onPressed: () => Navigator.pop(context),
                        ),
                        MainButton(
                          lang.next,
                          size.width / 2 - 24,
                          hasElevation: true,
                          fontSize: 15,
                          onPressed: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const MyGoogleMap(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future determineLocation(BuildContext context, Size size) {
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
      barrierColor: KTColors.transparent,
      isDismissible: false,
      builder: (context) {
        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(
                    endIndent: size.width * 0.4,
                    indent: size.width * 0.4,
                    thickness: 3,
                    color: KTColors.border,
                  ),
                  const MySearchField(
                    hasFilter: false,
                    autofocus: false,
                  ),
                  TextField(
                    readOnly: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    controller: TextEditingController()..text = "Olmazor tumani",
                    style: ktHintStyle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox.square(
                          dimension: 20,
                          child: SvgPicture.asset(KTIcons.location),
                        ),
                      ),
                      filled: true,
                      fillColor: KTColors.whiteF5,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SecondaryButton(
                          lang.back,
                          size.width / 2 - 24,
                          onPressed: () => Navigator.pop(context),
                        ),
                        MainButton(
                          lang.next,
                          size.width / 2 - 24,
                          hasElevation: true,
                          fontSize: 15,
                          onPressed: () {
                            whenServiceNeed(context, size);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future whenServiceNeed(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);
    List<String> problems = [
      "Bugun, 7-aprel",
      "Ertaga, 8-aprel",
      "Hafta davomida 14-aprelgacha",
      "Men taqvimdagi kunlarni tanlayman",
      "Mutaxassis uchun qulay bo’lganda",
    ];
    List<String> values = List.generate(5, (index) => index.toString());
    String groupValue = "";

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
        groupValue = values.first;

        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.gapY(),
                  ...orderServiceTitle(context, size, lang),
                  Expanded(
                    child:
                        StatefulBuilder(builder: (context, StateSetter state) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView(
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Text(
                                lang.whenServiceNeed,
                                textAlign: TextAlign.center,
                                style: ktBodyMediumStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...List.generate(
                                problems.length,
                                (index) => RadioListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity:
                                      const VisualDensity(vertical: -3),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    problems[index],
                                    style: ktRegularStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: values[index],
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value!;
                                    state(() {});
                                  },
                                ),
                              ),
                              80.gapY(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SecondaryButton(
                                  lang.back,
                                  size.width / 2 - 24,
                                  onPressed: () => Navigator.pop(context),
                                ),
                                MainButton(
                                  lang.next,
                                  size.width / 2 - 24,
                                  hasElevation: true,
                                  fontSize: 15,
                                  onPressed: () => workLocation(context, size),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future workLocation(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);
    List<String> problems = [
      "Xonadonda",
      "Xususiy uyda",
      "Turar-joy bo’lmagan binolarda",
      "Boshqa",
    ];
    List<String> values = List.generate(4, (index) => index.toString());
    String groupValue = "";

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
        groupValue = values.first;

        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: size.height * 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.gapY(),
                  ...orderServiceTitle(context, size, lang),
                  Expanded(
                    child:
                        StatefulBuilder(builder: (context, StateSetter state) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView(
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Text(
                                lang.whereWorkLocation,
                                textAlign: TextAlign.center,
                                style: ktBodyMediumStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...List.generate(
                                problems.length,
                                (index) => RadioListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity:
                                      const VisualDensity(vertical: -3),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  title: Text(
                                    problems[index],
                                    style: ktRegularStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: values[index],
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value!;
                                    state(() {});
                                  },
                                ),
                              ),
                              80.gapY(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SecondaryButton(
                                  lang.back,
                                  size.width / 2 - 24,
                                  onPressed: () => Navigator.pop(context),
                                ),
                                MainButton(
                                  lang.next,
                                  size.width / 2 - 24,
                                  hasElevation: true,
                                  fontSize: 15,
                                  onPressed: () =>
                                      Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const BasePage(),
                                    ),
                                    (route) => false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static List<Widget> orderServiceTitle(context, size, lang) => [
        Divider(
          endIndent: size.width * 0.4,
          indent: size.width * 0.4,
          thickness: 3,
          color: KTColors.border,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
            Text(
              lang.orderService,
              textAlign: TextAlign.center,
              style: ktTitleStyle,
            ),
            const SizedBox(width: 20),
          ],
        ),
        const Divider(color: KTColors.border),
        10.gapY(),
      ];
}
