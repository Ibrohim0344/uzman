import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../../data/tools/extensions/int_extensions.dart';

class PeoplesComment extends StatefulWidget {
  final String avatar;
  final String fullName;
  final int starRanking;
  final String comment;
  final int likes;
  final String date;

  const PeoplesComment({
    required this.avatar,
    required this.fullName,
    required this.starRanking,
    required this.comment,
    required this.likes,
    required this.date,
    super.key,
  });

  @override
  State<PeoplesComment> createState() => _PeoplesCommentState();
}

class _PeoplesCommentState extends State<PeoplesComment> {
  bool isLiked = false;
  int likeCount = 0;

  void tapLike() => setState(() {
        isLiked = !isLiked;
        likeCount = isLiked ? ++likeCount : --likeCount;
      });

  @override
  void initState() {
    likeCount = widget.likes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onDoubleTap: tapLike,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(widget.avatar),
                ),
                Text(
                  "   ${widget.fullName}",
                  style: ktMediumStyle,
                ),
                const Spacer(),
                ActionChip(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 6,
                  ),
                  shape: const StadiumBorder(),
                  backgroundColor: KTColors.white,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  side: const BorderSide(
                    width: 1.5,
                    color: KTColors.mainRed,
                  ),
                  label: Row(
                    children: [
                      SvgPicture.asset(
                        KTIcons.starRed,
                      ),
                      Text(
                        "  ${widget.starRanking}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: KTColors.mainRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.comment,
                style: ktRegularStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: tapLike,
                  child: SvgPicture.asset(
                    isLiked ? KTIcons.like : KTIcons.unlike,
                  ),
                ),
                Text(
                  "  $likeCount",
                  style: ktRegularStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                16.gapX(),
                Text(
                  widget.date,
                  style: ktRegularStyle.copyWith(
                    color: KTColors.grey61,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
