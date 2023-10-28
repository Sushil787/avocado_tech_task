import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/core/constants/api_constants.dart';
import 'package:starter/core/dio/dio_client.dart';

@injectable

/// Post Service Class
class PostServices {
  ///Public Constructor
  PostServices(this._dioClient);

  /// Dio Client
  final DioClient _dioClient;

  /// Gets all posts
  Future<Either<String, Response<dynamic>>> posts() async {
    final response = await _dioClient.request(
      requestType: RequestType.get,
      path: ApiConstant.posts,
    );
    return response;
  }

  /// Post Detail posts
  Future<Either<String, Response<dynamic>>> postDetail({
    required int postId,
  }) async {
    final response = await _dioClient.request(
      requestType: RequestType.get,
      path: '${ApiConstant.posts}/$postId',
    );
    return response;
  }

  /// Post Detail posts
  Future<Either<String, Response<dynamic>>> postsComment({
    required int postId,
  }) async {
    final response = await _dioClient.request(
      requestType: RequestType.get,
      path: '${ApiConstant.posts}/$postId/comments',
    );
    return response;
  }

  /// Comments with Post Id
  Future<Either<String, Response<dynamic>>> commentsPost({
    required int postId,
  }) async {
    final response = await _dioClient.request(
      requestType: RequestType.get,
      path: '${ApiConstant.comments}postId=$postId',
    );
    return response;
  }
}
