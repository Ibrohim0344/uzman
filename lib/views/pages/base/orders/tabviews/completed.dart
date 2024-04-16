import 'package:flutter/material.dart';

import '../widgets/work_status.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        WorkStatusCard(status: WorkStatus.completed),
        WorkStatusCard(status: WorkStatus.completed),
        WorkStatusCard(status: WorkStatus.completed),
      ],
    );
  }
}
