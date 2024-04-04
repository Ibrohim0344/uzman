import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountCard extends StatelessWidget {
  final String card;
  final String picture;
  final String percent;
  final String title;
  final String description;

  const DiscountCard({
    required this.card,
    required this.picture,
    required this.percent,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          SvgPicture.asset(card),
          SvgPicture.asset(picture),
        ],
      ),
    );
  }
}
