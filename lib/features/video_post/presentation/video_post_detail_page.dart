import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/core/extensions/helper_extension.dart';
import 'package:starter/core/utils/gap.dart';
import 'package:starter/features/video_post/domain/model.dart';
import 'package:starter/features/video_post/widgets/post_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Post Detail Page
class PostDetailPage extends StatefulWidget {
  ///
  const PostDetailPage({required this.post, super.key});

  ///
  final SocailPost post;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.post.socialLink,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    youtubePlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
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
            Icons.favorite,
          ),
          HorizontalGap.m,
          Icon(
            Icons.share,
          ),
          HorizontalGap.m,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            youtubePlayerWidget(context),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSocialWidget(
                          context,
                          asset: widget.post.assetsPath,
                          color: widget.post.color,
                          text: widget.post.text,
                        ),
                        Text(
                          widget.post.time,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.post.title,
                  ),
                  RichText(
                    // textAlign: TextAlign.start,
                    text: TextSpan(
                      text:
                          '${widget.post.totalViews} views ${widget.post.postDate} ',
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black, height: 1.3),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.post.tags,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  ),
                  VerticalGap.m,
                  Text(
                    widget.post.detail + widget.post.detail,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Youtube Video Player
  Container youtubePlayerWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      height: context.width / 1.8,
      width: context.width,
      child: YoutubePlayer(
        controller: youtubePlayerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
