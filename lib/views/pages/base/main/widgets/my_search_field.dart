import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data/tools/bottom_sheets/filter_sheets.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';

class MySearchField extends StatefulWidget {
  final bool isEnabled;
  final TextEditingController? controller;
  final bool autofocus;
  final bool hasFilter;

  const MySearchField({
    this.isEnabled = true,
    this.autofocus = true,
    this.hasFilter = true,
    this.controller,
    super.key,
  });

  @override
  State<MySearchField> createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  final _focus = FocusNode();
  String searchIcon = KTIcons.search;

  void _onFocusChange() {
    setState(() {
      searchIcon = _focus.hasFocus ? KTIcons.searchRed : KTIcons.search;
    });
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalization();

    return TextField(
      enabled: widget.isEnabled,
      cursorColor: KTColors.mainRed,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      controller: widget.controller,
      autofocus: widget.autofocus,
      focusNode: _focus,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox.square(
            dimension: 20,
            child: SvgPicture.asset(searchIcon),
          ),
        ),
        suffixIcon: widget.hasFilter
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () => FilterSheets.filterSheet(context, size),
                  child: SvgPicture.asset(KTIcons.filter),
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: KTColors.mainRed),
        ),
        filled: true,
        fillColor: KTColors.whiteF5,
        hintText: lang.search,
        hintStyle: ktHintStyle,
      ),
    );
  }
}
