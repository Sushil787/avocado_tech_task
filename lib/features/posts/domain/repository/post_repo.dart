import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// JsonPlaceholder Post's Repo
abstract class PostRepository {
  /// Get Posts
  Future<Either<String, Response<dynamic>>> posts();

  /// Post Detail
  Future<Either<String, Response<dynamic>>> postsDetail({
    required int postId,
  });

  /// Post Comments
  Future<Either<String, Response<dynamic>>> postsComment({
    required int postId,
  });

  /// Comments With Post ID
  Future<Either<String, Response<dynamic>>> commentsPosts({
    required int postId,
  });
}
