import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/assets/images.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/extensions/int_extensions.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/open_page.dart';
import '../../chats/chat/chat_detail.dart';

enum WorkStatus { upcoming, completed, canceled }

class WorkStatusCard extends StatefulWidget {
  final WorkStatus status;

  const WorkStatusCard({required this.status, super.key});

  @override
  State<WorkStatusCard> createState() => _WorkStatusCardState();
}

class _WorkStatusCardState extends State<WorkStatusCard> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalization();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox.square(
                      dimension: 120,
                      child: Image(
                        image: AssetImage(KTImages.exampleWorker),
                      ),
                    ),
                    const SizedBox(width: 4),
                    SizedBox(
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Uy tozalash",
                            overflow: TextOverflow.ellipsis,
                            style: ktTitleMediumStyle.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Mohira Karimova",
                            overflow: TextOverflow.ellipsis,
                            style: ktRegularStyle.copyWith(
                              color: KTColors.black42,
                              fontSize: 13,
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: switch (widget.status) {
                                WorkStatus.upcoming => KTColors.orange,
                                WorkStatus.completed => KTColors.green,
                                WorkStatus.canceled => KTColors.red,
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              child: Text(
                                switch (widget.status) {
                                  WorkStatus.upcoming => lang.upcoming,
                                  WorkStatus.completed => lang.completed,
                                  WorkStatus.canceled => lang.canceled,
                                },
                                style: ktLightStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => getTo(context, Chat()),
                      child: CircleAvatar(
                        backgroundColor: KTColors.whiteF5,
                        child: SvgPicture.asset(KTIcons.chatYellow),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(color: KTColors.border),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: isTap ? 330 : 0,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lang.dateTime,
                              style: ktRegularStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: KTColors.grey61,
                                fontSize: 13,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Dec 12, 2024 | 13:00 - 15:00 PM",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: ktSemiBoldStyle.copyWith(
                                  color: KTColors.black42,
                                  fontSize: 14,
                                ),
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
                                lang.address,
                                style: ktRegularStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: KTColors.grey61,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "1691 Carpenter Pass",
                                style: ktSemiBoldStyle.copyWith(
                                  color: KTColors.black42,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            color: KTColors.lightPurple,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        12.gapY(),
                        MainButton(
                          lang.viewViaGoogle,
                          size.width,
                          height: 40,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    isTap = !isTap;
                    setState(() {});
                  },
                  child: Icon(
                    isTap
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
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
