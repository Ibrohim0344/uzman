import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/extensions/int_extensions.dart';
import '../../../../widgets/example_strings.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        leading: const BackButton(),
        title: Text(lang.specialOffers),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            discountCards.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 162,
                child: Stack(
                  alignment: const Alignment(.74, .9),
                  children: [
                    Image(
                      image: AssetImage(discountCards[index]),
                    ),
                    Image(
                      height: 150,
                      image: AssetImage(discountImages[index]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${discounts[index].percent}%",
                                  style: ktBodyLargeStyle.copyWith(
                                    color: KTColors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  discounts[index].title,
                                  style: ktButtonTextStyle.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                8.gapY(),
                                Text(
                                  discounts[index].description,
                                  style: ktLightStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
