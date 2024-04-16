import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/assets/images.dart';
import '../../../../../data/tools/constants/style/fonts.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  void endCall() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 110),
              child: Image(
                image: AssetImage(KTImages.splashBG),
              ),
            ),
            const Positioned(
              top: 219,
              left: 51,
              child: SizedBox.square(
                dimension: 250,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(KTImages.girlInPhone),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                Text(
                  "Jenny Wilson",
                  style: ktBodyLargeStyle.copyWith(fontSize: 28),
                ),
                SizedBox(height: size.width * .24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: endCall,
                        child: SvgPicture.asset(KTIcons.endCall),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Image(
                          image: AssetImage(KTImages.videoCall),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(KTIcons.speaker),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.width * .1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
