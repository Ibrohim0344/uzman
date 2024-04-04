import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/tools/constants/assets/icons.dart';
import '../../data/tools/constants/assets/images.dart';
import '../../data/tools/constants/language/getx_translation.dart';
import '../../data/tools/constants/style/colors.dart';
import '../../data/tools/constants/style/fonts.dart';
import '../pages/base/chats/chat/chat_detail.dart';
import '../pages/base/main/worker_details/worker_detail_page.dart';
import 'open_page.dart';

class WorkerCard extends StatelessWidget {
  final String? category;

  const WorkerCard({this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: KTColors.white,
          boxShadow: [
            BoxShadow(
              color: KTColors.shadow,
              offset: Offset(0, 1),
              blurRadius: 16,
              spreadRadius: -8,
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const WorkerDetailPage(),
                  )),
                  child: const SizedBox.square(
                    dimension: 120,
                    child: Image(
                      image: AssetImage(KTImages.exampleWorker),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Mohira Karimova",
                              overflow: TextOverflow.ellipsis,
                              style: ktRegularStyle.copyWith(
                                color: KTColors.black42,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => getTo(context, Chat()),
                            child: CircleAvatar(
                              backgroundColor: KTColors.whiteF5,
                              child: SvgPicture.asset(KTIcons.chatYellow),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        category ?? "House Cleaning",
                        style: ktTitleMediumStyle.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Text(
                              "\$25",
                              style: ktTitleMediumStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: KTColors.mainRed,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: KTColors.mainRed,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(KTIcons.clock),
                                      Text(
                                        " 7/24",
                                        style: ktLightStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SvgPicture.asset(KTIcons.success),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(KTIcons.star),
                          Text(
                            " 4.8 | 8,289 ${lang.comments}",
                            style: ktRegularStyle.copyWith(
                              color: KTColors.black42,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
