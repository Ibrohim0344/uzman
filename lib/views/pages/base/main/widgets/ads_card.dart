import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/assets/images.dart';

class AdsCard extends StatelessWidget {
  final Size size;

  const AdsCard({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: KTColors.transparent,
          image: DecorationImage(
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            image: AssetImage(KTImages.adCardRed),
          ),
        ),
        child: Stack(
          children: [
            Transform.scale(
              scale: .9,
              child: const Align(
                alignment: Alignment(.77, 1),
                child: Image(
                  image: AssetImage(KTImages.splashWorker1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "30%",
                          style: ktBodyImmenseStyle.copyWith(
                            color: KTColors.white,
                            fontSize: 36,
                            height: .8,
                          ),
                        ),
                        Text(
                          "Bugungi maxsus!",
                          style: ktTitleStyle.copyWith(color: KTColors.white),
                        ),
                        Text(
                          "Har biriga chegirma oling buyurtma, faqat bugun amal qiladi",
                          style: ktLightStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
