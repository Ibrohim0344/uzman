import 'package:flutter/material.dart';

class MyClippedImage extends StatelessWidget {
  final String imagePath;
  final double height;

  const MyClippedImage(
    this.imagePath, {
    this.height = 135,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Image(
        height: height,
        width: size.width / 2 - 22,
        fit: BoxFit.fitHeight,
        image: AssetImage(imagePath),
      ),
    );
  }
}
