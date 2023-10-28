import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/core/constants/app_route.dart';
import 'package:starter/features/posts/presentation/post_page.dart';
import 'package:starter/features/video_post/domain/model.dart';
import 'package:starter/features/video_post/presentation/video_post_detail_page.dart';
import 'package:starter/features/video_post/presentation/video_post_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Go router instance
@injectable
class AppRouter {
  final GoRouter _goRouter = GoRouter(
    initialLocation: AppRoute.homeRoute,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoute.homeRoute,
        builder: (context, state) => const PostPage(),
      ),
      GoRoute(
        path: AppRoute.videoPost,
        builder: (context, state) => const VideoPostPage(),
      ),
      GoRoute(
        path: AppRoute.postDetail,
        builder: (context, state) {
          final post = state.extra! as SocailPost;
          return PostDetailPage(
            post: post,
          );
        },
      ),
    ],
  );

  /// Router
  GoRouter get router => _goRouter;
}
