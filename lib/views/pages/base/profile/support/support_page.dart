import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../main/widgets/my_search_field.dart';
import '../../main/widgets/my_action_chip.dart';
import '../widgets/contact_button.dart';
import 'widgets/my_expansion_tile.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  late final TextEditingController controller;

  List<String> contactIcons = [
    KTIcons.support,
    KTIcons.whatsApp,
    KTIcons.webSite,
    KTIcons.facebookRed,
    KTIcons.twitter,
    KTIcons.instagram,
  ];

  List<String> contactTitles = [
    "Customer Service",
    "WhatsApp",
    "Website",
    "Facebook",
    "Twitter",
    "Instagram",
  ];

  List<String> questions = [
    "What is UZMAN?",
    "How to use UZMAN?",
    "How do I cancel a booking?",
    "How do I save the chats?",
    "How do I exit the app?",
  ];

  List<String> answers = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  ];

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: KTColors.white,
        appBar: AppBar(
          backgroundColor: KTColors.white,
          surfaceTintColor: KTColors.white,
          leading: const BackButton(),
          title: Text(
            lang.helpCenter,
            style: ktRegularStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            indicatorColor: KTColors.mainRed,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            labelStyle: ktSemiBoldStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            labelColor: KTColors.mainRed,
            splashFactory: NoSplash.splashFactory,
            unselectedLabelColor: KTColors.greyHint,
            tabs: [
              const Tab(text: "FAQ"),
              Tab(text: lang.contactUs),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TabBarView(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const MyActionChip(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: MySearchField(
                      controller: controller,
                      autofocus: false,
                      hasFilter: false,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) => MyExpansionTile(
                        question: questions[index],
                        answer: answers[0],
                        onExpansionChanged: (bool s) {},
                        isCollapsed: true,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => ContactButton(
                  iconPath: contactIcons[index],
                  title: contactTitles[index],
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
