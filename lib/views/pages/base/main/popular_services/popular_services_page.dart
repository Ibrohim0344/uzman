import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../widgets/open_page.dart';
import '../../../../widgets/worker_card.dart';
import '../search/search_page.dart';
import '../widgets/my_action_chip.dart';

class PopularServicesPage extends StatelessWidget {
  const PopularServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        leading: const BackButton(),
        title: Text(lang.popularServices),
        actions: [
          GestureDetector(
            onTap: () => getTo(context, const SearchPage()),
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(KTIcons.searchBlack),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const MyActionChip(),
          ...List.generate(
            10,
            (index) => const WorkerCard(),
          ),
        ],
      ),
    );
  }
}
