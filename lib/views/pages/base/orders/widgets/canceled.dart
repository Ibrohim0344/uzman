import 'package:flutter/material.dart';

import 'work_status.dart';

class Canceled extends StatelessWidget {
  const Canceled({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        WorkStatusCard(status: WorkStatus.canceled),
        WorkStatusCard(status: WorkStatus.canceled),
        WorkStatusCard(status: WorkStatus.canceled),
      ],
    );
  }
}
