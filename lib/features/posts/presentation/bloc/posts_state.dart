part of 'posts_bloc.dart';

@freezed

/// Post State
class PostsState with _$PostsState {
  /// Initial State
  const factory PostsState.initial() = _Initial;

  /// Loading State
  const factory PostsState.loading() = _Loading;

  /// Loaded State
  const factory PostsState.loaded({required List<Posts> posts}) = _Loaded;

  /// Error State
  const factory PostsState.error(String message) = _Error;
}
