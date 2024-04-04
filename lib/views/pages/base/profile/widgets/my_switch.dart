import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/style/colors.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: KTColors.mainRed,
      value: value,
      activeColor: KTColors.mainRed,
      inactiveThumbColor: const Color(0xFFEEEEEE),
      inactiveTrackColor: const Color(0xFFEEEEEE),
      trackOutlineColor: MaterialStateProperty.all(Colors.white),
      trackOutlineWidth: MaterialStateProperty.all(2),
      splashRadius: 1,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
      onChanged: onChanged,
    );
  }
}
