import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/storage/local_storage.dart';
import '../orders/widgets/title_and_textbutton.dart';
import 'category_detail/category_detail_page.dart';
import 'widgets/ads_card.dart';
import 'search/search_page.dart';
import 'offers/offers_page.dart';
import 'widgets/my_action_chip.dart';
import 'widgets/my_search_field.dart';
import 'widgets/category_widget.dart';
import '../../../widgets/open_page.dart';
import '../../../widgets/worker_card.dart';
import 'all_services/all_services_page.dart';
import 'notifications/notifications_page.dart';
import 'popular_services/popular_services_page.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/assets/icons.dart';
import '../../../../data/tools/constants/language/getx_translation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;
  final imagePath = LocalStorage.getUser().imagePath;

  void getToNotifications() => getTo(context, const NotificationsPage());

  void getToAllServices() => getTo(context, const AllServicesPage());

  void getToOffers() => getTo(context, const OffersPage());

  void getToPopularServices() => getTo(context, const PopularServicesPage());

  void getToSearch() => getTo(context, const SearchPage());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalization();
    final fullName = LocalStorage.getUser().fullName;
    final currentTime = DateTime.now().hour;
    final greeting = currentTime < 10
        ? lang.goodMorning
        : currentTime > 9 && currentTime < 17
            ? lang.goodAfternoon
            : lang.goodEvening;

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: KTColors.secondaryLightBlue,
              backgroundImage:
                  imagePath != null ? FileImage(File(imagePath!)) : null,
              child: imagePath == null
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        KTIcons.userLarge,
                        fit: BoxFit.fitHeight,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$greeting👋",
                  style: ktRegularStyle.copyWith(
                    fontSize: 15,
                    color: KTColors.grey75,
                  ),
                ),
                Text(
                  "$fullName",
                  style: ktRegularStyle.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: getToNotifications,
              child: SvgPicture.asset(KTIcons.notification),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        color: KTColors.mainRed,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: GestureDetector(
                onTap: getToSearch,
                child: const MySearchField(isEnabled: false),
              ),
            ),
            TitleAndTextButton(
              title: lang.offers,
              textButton: lang.all,
              onPressed: getToOffers,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) =>
                        AdsCard(size: size),
                    options: CarouselOptions(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 1,
                      height: 170,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnManualNavigate: true,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 146),
                    child: Center(
                      child: buildIndicator(activeIndex),
                    ),
                  ),
                ],
              ),
            ),
            TitleAndTextButton(
              title: lang.services,
              textButton: lang.all,
              onPressed: getToAllServices,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryWidget(
                        category: KTIcons.clean,
                        text: lang.cleaning,
                        bgColor: KTColors.purple,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.cleaning),
                        ),
                      ),
                      CategoryWidget(
                        category: KTIcons.repair,
                        text: lang.repair,
                        bgColor: KTColors.orange,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.repair),
                        ),
                      ),
                      CategoryWidget(
                        category: KTIcons.paint,
                        text: lang.paint,
                        bgColor: KTColors.blue,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.paint),
                        ),
                      ),
                      CategoryWidget(
                        category: KTIcons.laundry,
                        text: lang.laundry,
                        bgColor: KTColors.yellow,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.laundry),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryWidget(
                        category: KTIcons.furniture,
                        text: lang.furniture,
                        bgColor: KTColors.red,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.furniture),
                        ),
                      ),
                      CategoryWidget(
                        category: KTIcons.plumbing,
                        text: lang.plumbing,
                        bgColor: KTColors.green,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.plumbing),
                        ),
                      ),
                      CategoryWidget(
                        category: KTIcons.delivery,
                        text: lang.delivery,
                        bgColor: KTColors.lightBlue,
                        onTap: () => getTo(
                          context,
                          CategoryDetailPage(lang.delivery),
                        ),
                      ),
                      CategoryWidget(
                        category: KTIcons.more,
                        text: lang.more,
                        bgColor: KTColors.greyHint,
                        onTap: getToAllServices,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: KTColors.border),
            ),
            TitleAndTextButton(
              title: lang.popularServices,
              textButton: lang.all,
              onPressed: getToPopularServices,
            ),
            const MyActionChip(),
            ...List.generate(
              5,
              (index) => const WorkerCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int activeIndex) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: const ExpandingDotsEffect(
          dotWidth: 5,
          dotHeight: 5,
          expansionFactor: 3.5,
          activeDotColor: KTColors.white,
          dotColor: KTColors.white,
        ),
      );

  Widget titleText(String title, AppLocalization lang, VoidCallback getTo) =>
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: ktTitleStyle,
            ),
            TextButton(
              onPressed: getTo,
              child: Text(
                lang.all,
                style: ktEssentialStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
}
