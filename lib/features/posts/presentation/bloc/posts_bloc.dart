// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/features/posts/domain/model/posts_model.dart';
import 'package:starter/features/posts/domain/repository/post_repo.dart';

part 'posts_event.dart';
part 'posts_state.dart';
part 'posts_bloc.freezed.dart';

@Injectable()

/// Post Bloc
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this._postRepository) : super(const _Initial()) {
    on<PostsEvent>((event, emit) async {
      await event.map(
        fetchPost: (_) => fetchPost(emit),
      );
    });
  }
  final PostRepository _postRepository;

  /// Fetch Posts
  Future<void> fetchPost(Emitter<PostsState> emit) async {
    emit(const PostsState.loading());
    final data = await _postRepository.posts();
    emit(
      data.fold(
        (message) {
          return PostsState.error(message);
        },
        (response) {
          final postsList = (response.data as List<dynamic>)
              .map((e) => Posts.fromJson(e as Map<String, dynamic>))
              .toList();
          return PostsState.loaded(posts: postsList);
        },
      ),
    );
  }
}
