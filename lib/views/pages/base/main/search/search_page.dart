import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../orders/widgets/title_and_textbutton.dart';
import '../widgets/my_search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController controller;

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

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const MySearchField(),
            const SizedBox(height: 10),
            TitleAndTextButton(
              title: lang.recent,
              textButton: lang.cleaning,
              onPressed: () {},
              hasPadding: false,
            ),
            const Divider(color: KTColors.border),
            MyRecentSearch(controller: controller),
          ],
        ),
      ),
    );
  }
}

class MyRecentSearch extends StatefulWidget {
  final TextEditingController controller;

  const MyRecentSearch({required this.controller, super.key});

  @override
  State<MyRecentSearch> createState() => _MyRecentSearchState();
}

class _MyRecentSearchState extends State<MyRecentSearch> {
  List<String> recentSearch = [
    "Motorcycle Repairing",
    "Painting the Walls",
    "Water Faucet Repairing",
    "Window Cleaning",
    "House Shifting",
    "Computer Repairing",
    "Cloth Laundry",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        recentSearch.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  widget.controller.text = recentSearch[index];
                  setState(() {});
                },
                child: Text(
                  recentSearch[index],
                  style: ktSearchStyle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  recentSearch.removeAt(index);
                  setState(() {});
                },
                child: SvgPicture.asset(KTIcons.clear),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
