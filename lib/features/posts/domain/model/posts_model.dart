import 'package:freezed_annotation/freezed_annotation.dart';
part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed

/// Posts Model
class Posts with _$Posts {
  ///
  factory Posts({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _Posts;

  /// From Json Factory Constructor
  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
}
