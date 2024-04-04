import 'package:flutter/material.dart';

import 'my_clipped_image.dart';

class PhotosFromWork extends StatelessWidget {
  final bool reverse;
  final String imageBig;
  final String image1;
  final String image2;

  const PhotosFromWork({
    required this.imageBig,
    required this.image1,
    required this.image2,
    this.reverse = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        reverse
            ? SizedBox(
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyClippedImage(image1),
                    MyClippedImage(image2),
                  ],
                ),
              )
            : MyClippedImage(
                imageBig,
                height: 280,
              ),
        reverse
            ? MyClippedImage(
                imageBig,
                height: 280,
              )
            : SizedBox(
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyClippedImage(image1),
                    MyClippedImage(image2),
                  ],
                ),
              ),
      ],
    );
  }
}
