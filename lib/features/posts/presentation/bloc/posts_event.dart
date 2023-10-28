// ignore_for_file: public_member_api_docs

part of 'posts_bloc.dart';

@freezed
class PostsEvent with _$PostsEvent {
  const factory PostsEvent.fetchPost() = _FetchPost;
 
}
