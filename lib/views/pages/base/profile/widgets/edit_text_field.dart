import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';

class EditTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatter;

  const EditTextField({
    required this.controller,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.inputFormatter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        inputFormatters: inputFormatter,
        style: ktHintStyle.copyWith(
          color: KTColors.black,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: KTColors.textFieldBG,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
