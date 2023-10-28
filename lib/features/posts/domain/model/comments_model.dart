
import 'package:freezed_annotation/freezed_annotation.dart';
part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
/// Comments Model
class Comments with _$Comments{
  /// 
  factory Comments({
    required  int postId,
    required int id,
    required String name,
    required String email, 
    required String body,
    
  }) = _Comments;
 ///
  factory Comments.fromJson(Map<String,dynamic> json)=> _$CommentsFromJson(json);
}