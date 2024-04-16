import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

import '../../../../../data/storage/local_storage.dart';
import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/assets/images.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/extensions/int_extensions.dart';
import '../../pages/base/chats/chat/chat_detail.dart';
import '../main_button.dart';
import '../my_rating_chip.dart';
import '../open_page.dart';
import 'widgets/photos_from_work.dart';
import 'widgets/comment.dart';

class WorkerDetailPage extends StatelessWidget {
  const WorkerDetailPage({super.key});

  static final isCollapsed = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);
    final safePadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: KTColors.white,
      body: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Image(
            height: 300 + safePadding,
            fit: BoxFit.cover,
            image: const AssetImage(KTImages.applianceService),
          ),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              300.gapY(),
              ColoredBox(
                color: KTColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Car Repairing",
                            style: ktBodyLargeStyle.copyWith(
                              fontSize: 28,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wade Warren",
                              style: ktTitleStyle.copyWith(
                                color: KTColors.mainRed,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  12.gapX(),
                                  SvgPicture.asset(KTIcons.star),
                                  Expanded(
                                    child: Text(
                                      " 4.9 | (6,273) ${lang.comments}",
                                      style: ktRegularStyle.copyWith(
                                        color: KTColors.black42,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              color: KTColors.lightPurple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                "Appliance",
                                style: ktEssentialStyle.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 10,
                            ),
                            child: SvgPicture.asset(KTIcons.locationRed),
                          ),
                          const Text("232 Washington Circle"),
                        ],
                      ),
                      10.gapY(),
                      Row(
                        children: [
                          Text(
                            r"$26",
                            style: ktBodyLargeStyle.copyWith(
                              fontSize: 32,
                              color: KTColors.mainRed,
                            ),
                          ),
                          Text("  (${lang.price})"),
                        ],
                      ),
                      const Divider(color: KTColors.border),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          lang.aboutMe,
                          style: ktTitleStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ReadMoreText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim nisi ut aliquip.",
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          lessStyle: ktEssentialStyle,
                          isCollapsed: isCollapsed,
                          trimCollapsedText: " Read more",
                          trimExpandedText: " Less",
                          moreStyle: ktEssentialStyle,
                          style: ktRegularStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            lang.photosFromWork,
                            style: ktTitleStyle,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                lang.viewAll,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: ktEssentialStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      12.gapY(),
                      const PhotosFromWork(
                        imageBig: KTImages.carRepairBig1,
                        image1: KTImages.carRepair1,
                        image2: KTImages.carRepair2,
                      ),
                      12.gapY(),
                      const PhotosFromWork(
                        imageBig: KTImages.carRepairBig2,
                        image1: KTImages.carRepair3,
                        image2: KTImages.carRepair4,
                        reverse: true,
                      ),
                      12.gapY(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            KTIcons.star,
                            height: 20,
                          ),
                          Text(
                            " 4.9 (6,273) ${lang.comments}",
                            style: ktTitleStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                lang.viewAll,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: ktEssentialStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      MyRatingChip(lang, hasHorizontalGap: false),
                      PeoplesComment(
                        avatar: KTImages.girlInPhone,
                        fullName: LocalStorage.getUser().fullName ?? "Nigina",
                        starRanking: 5,
                        comment:
                            "Uyimni juda ham yaxshi tozaladi hattoki menga boshqa ishlarda ham yordam berdi muomilasi ham juda yoqimli  ❤️❤️️❤️",
                        likes: 724,
                        date: "3 weeks ago",
                      ),
                      const PeoplesComment(
                        avatar: KTImages.friend,
                        fullName: "Thad Eddings",
                        starRanking: 2,
                        comment:
                            "This is the first time I've used his services, and the results were amazing! 👍👍👍",
                        likes: 264,
                        date: "2 weeks ago",
                      ),
                      const PeoplesComment(
                        avatar: KTImages.carRepair,
                        fullName: "Titus Kitamura",
                        starRanking: 1,
                        comment:
                            "The workers are very professional and the results are very satisfying! I like it very much! 💯💯💯",
                        likes: 1,
                        date: "1 week ago",
                      ),
                    ],
                  ),
                ),
              ),
              70.gapY(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: kToolbarHeight),
            child: BackButton(color: KTColors.white),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: KTColors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                border: Border.all(color: KTColors.border),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MainButton(
                  lang.message,
                  size.width,
                  onPressed: () => getTo(context, Chat()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
