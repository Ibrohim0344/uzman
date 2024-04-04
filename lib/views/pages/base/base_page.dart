import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/tools/constants/style/fonts.dart';
import 'main/main_page.dart';
import 'chats/chats_page.dart';
import 'orders/orders_page.dart';
import 'profile/profile_page.dart';
import '../../../data/tools/constants/assets/icons.dart';
import '../../../data/tools/constants/style/colors.dart';
import '../../../data/tools/constants/language/getx_translation.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  late PageController controller;
  List<Widget> pages = const [
    MainPage(),
    OrdersPage(),
    ChatsPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: KTColors.white,
        unselectedLabelStyle: ktLabelStyle,
        selectedLabelStyle: ktLabelStyle.copyWith(color: KTColors.mainRed),
        selectedItemColor: KTColors.mainRed,
        unselectedItemColor: KTColors.greyHint,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex = value;
          controller.animateToPage(
            currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: navbarIcon(KTIcons.home),
            activeIcon: navbarIcon(KTIcons.homeActive),
            label: lang.main,
          ),
          BottomNavigationBarItem(
            icon: navbarIcon(KTIcons.document),
            activeIcon: navbarIcon(KTIcons.documentActive),
            label: lang.orders,
          ),
          BottomNavigationBarItem(
            icon: navbarIcon(KTIcons.chat),
            activeIcon: navbarIcon(KTIcons.chatActive),
            label: lang.chats,
          ),
          BottomNavigationBarItem(
            icon: navbarIcon(KTIcons.profile),
            activeIcon: navbarIcon(KTIcons.profileActive),
            label: lang.profile,
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(pages.length, (index) => pages[index]),
      ),
    );
  }

  SvgPicture navbarIcon(String icon) => SvgPicture.asset(
        icon,
        height: 22,
      );
}
