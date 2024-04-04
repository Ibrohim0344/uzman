import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/style/fonts.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? makeObscure;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const AuthTextField(
    this.hintText, {
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscureText = true,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.makeObscure,
    this.inputFormatters,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      controller: controller,
      textInputAction: textInputAction,
      obscureText: makeObscure == null ? false : obscureText,
      // obscuringCharacter: "⊛",
      // obscuringCharacter: "⚫",
      obscuringCharacter: "•",
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: ktHintStyle.copyWith(color: KTColors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(14),
                child: prefixIcon,
              )
            : null,
        suffixIcon: GestureDetector(
          onTap: makeObscure,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: suffixIcon,
          ),
        ),
        fillColor: KTColors.textFieldBG,
        filled: true,
        hintText: hintText,
        hintStyle: ktHintStyle,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
