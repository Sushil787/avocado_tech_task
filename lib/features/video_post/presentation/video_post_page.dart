// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/core/constants/app_route.dart';
import 'package:starter/core/extensions/helper_extension.dart';
import 'package:starter/core/utils/gap.dart';
import 'package:starter/features/video_post/domain/data.dart';
import 'package:starter/features/video_post/widgets/post_widget.dart';
import 'package:starter/features/video_post/widgets/scroll_bar.dart';

/// video Post Page
class VideoPostPage extends StatefulWidget {
  const VideoPostPage({super.key});

  @override
  State<VideoPostPage> createState() => _VideoPostPageState();
}

class _VideoPostPageState extends State<VideoPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
          ),
          HorizontalGap.m,
          Icon(
            Icons.share,
          ),
          HorizontalGap.m,
        ],
      ),
      body: Column(
        children: [
          const BuildScrollBar(),
          
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16, left: 14, right: 14),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 8,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRoute.postDetail, extra: data[index]);
                    },
                    child: buildGridItemWidget(context, data[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
