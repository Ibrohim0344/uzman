import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../data/storage/local_storage.dart';
import '../../../data/tools/constants/style/colors.dart';
import '../../../data/tools/constants/assets/images.dart';
import '../base/base_page.dart';
import 'splash_carousel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final isAuthorized = LocalStorage.getUserStatus();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              isAuthorized ? const BasePage() : const SplashCarousel(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * .3,
          bottom: size.height * .1,
        ),
        child: const Column(
          children: [
            Center(
              child: Image(
                image: AssetImage(KTImages.uzman),
                width: 200,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                chasing,
                lines,
                circle,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const chasing = SpinKitChasingDots(
  color: KTColors.mainRed,
  duration: Duration(milliseconds: 1500),
);

const lines = SpinKitSpinningLines(
  color: KTColors.mainRed,
  lineWidth: 4,
  itemCount: 3,
  size: 55,
  duration: Duration(milliseconds: 1500),
);

const circle = SpinKitCircle(
  size: 60,
  duration: Duration(milliseconds: 1500),
  color: KTColors.mainRed,
);
