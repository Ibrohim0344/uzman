import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../widgets/worker_card.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;

  const CategoryDetailPage(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        leading: const BackButton(),
        title: Text(category),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          15,
          (index) => WorkerCard(category: category),
        ),
      ),
    );
  }
}
