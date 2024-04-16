import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/tools/constants/l10n/app_localizations.dart';
import '../../widgets/open_page.dart';
import '../auth/auth_page.dart';
import '../../widgets/main_button.dart';
import '../../../data/tools/constants/style/fonts.dart';
import '../../../data/tools/constants/style/colors.dart';
import '../../../data/tools/constants/assets/images.dart';

class SplashCarousel extends StatefulWidget {
  const SplashCarousel({super.key});

  @override
  State<SplashCarousel> createState() => _SplashCarouselState();
}

class _SplashCarouselState extends State<SplashCarousel> {
  List<String> carouselTexts = [];

  final List<String> carouselImages = [
    KTImages.splashWorker1,
    KTImages.splashWorker2,
    KTImages.splashWorker3,
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);
    carouselTexts = [lang.splashText1, lang.splashText2, lang.splashText3];

    return Scaffold(
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 56,
            ),
            child: Image(
              image: AssetImage(KTImages.splashBG),
            ),
          ),
          CarouselSlider.builder(
            itemCount: carouselImages.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: activeIndex != 0 ? 40 : 0,
                      ),
                      child: Image(
                        image: AssetImage(carouselImages[index]),
                        height: size.height * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
            options: carouselOption(size),
          ),
          Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: KTColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CarouselSlider.builder(
                      itemCount: carouselTexts.length,
                      itemBuilder: (context, index, realIndex) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                carouselTexts[index],
                                textAlign: TextAlign.center,
                                style: ktBodyLargeStyle,
                              ),
                            ),
                            const SizedBox(height: 76),
                          ],
                        );
                      },
                      options: carouselOption(size),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: size.height * 0.12,
            left: size.width * 0.4,
            child: buildIndicator(),
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Center(
                  child: MainButton(
                    lang.start,
                    size.width - 36,
                    onPressed: () => getTo(context, const AuthPage()),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CarouselOptions carouselOption(Size size) => CarouselOptions(
        viewportFraction: 1,
        height: size.height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayCurve: Curves.fastOutSlowIn,
        initialPage: 0,
        pauseAutoPlayOnTouch: true,
        onPageChanged: (index, reason) {
          setState(() => activeIndex = index);
        },
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: carouselTexts.length,
        effect: const ExpandingDotsEffect(
          dotWidth: 8,
          dotHeight: 8,
          expansionFactor: 4,
          spacing: 8,
          activeDotColor: KTColors.mainRed,
          dotColor: KTColors.lightGrey,
        ),
      );
}
