import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/features/posts/data/services/post_services.dart';
import 'package:starter/features/posts/domain/repository/post_repo.dart';

@Injectable(as: PostRepository)

/// Post Repository Implementation
class PostRepoImpl extends PostRepository {
  ///
  PostRepoImpl({required this.postServices});

  /// Post Services
  final PostServices postServices;
  @override
  Future<Either<String, Response<dynamic>>> commentsPosts({
    required int postId,
  }) async {
    final data = await postServices.commentsPost(postId: postId);
    return data;
  }

  @override
  Future<Either<String, Response<dynamic>>> posts() async {
    final data = await postServices.posts();
    return data;
  }

  @override
  Future<Either<String, Response<dynamic>>> postsComment(
      {required int postId,}) async {
    final data = await postServices.postsComment(postId: postId);
    return data;
  }

  @override
  Future<Either<String, Response<dynamic>>> postsDetail(
      {required int postId,}) async {
    final data = await postServices.postDetail(postId: postId);
    return data;
  }
}
