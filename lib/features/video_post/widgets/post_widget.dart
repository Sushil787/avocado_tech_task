import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starter/core/extensions/helper_extension.dart';
import 'package:starter/core/utils/gap.dart';
import 'package:starter/features/video_post/domain/model.dart';

/// Grid Item
Widget buildGridItemWidget(BuildContext context, SocailPost post) {
  return Container(
    padding: const EdgeInsets.only(left: 6, top: 6, right: 6),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black38),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Text(
          post.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        VerticalGap.m,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: buildSocialWidget(
                context,
                asset: post.assetsPath,
                color: post.color,
                text: post.text,
              ),
            ),
            HorizontalGap.s,
            // const Flexible(child: HorizontalGap.m),
            Text(
              post.time,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
        VerticalGap.m,
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.ytimg.com/vi/Pmg2PtMwhgs/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGE8gVihlMA8=&rs=AOn4CLCIY6Iy6ZeCQmKo269H0taMeJHe7A"))),
              height: context.height * .141,
            ),
            const Icon(
              Icons.play_circle_fill_rounded,
              size: 60,
              color: Colors.white,
            ),
          ],
        ),
      ],
    ),
  );
}

///
Widget buildSocialWidget(
  BuildContext context, {
  required String asset,
  required Color color,
  required String text,
}) {
  return Container(
    height: 20,
    padding: const EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          asset,
          color: Colors.white,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    ),
  );
}
