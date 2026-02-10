part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, error }

class PostState {
  String errorMessage;
  List<PostEntity> postsList;
  PostStatus postsListStatus;
  PostStatus createPostStatus;
  PostStatus deletePostStatus;

  PostState({
    this.errorMessage = '',
    this.postsList = const [],
    this.postsListStatus = PostStatus.initial,
    this.createPostStatus = PostStatus.initial,
    this.deletePostStatus = PostStatus.initial,
  });

  PostState copyWith({
    String? errorMessage,
    List<PostEntity>? postsList,
    PostStatus? postsListStatus,
    PostStatus? createPostStatus,
    PostStatus? deletePostStatus,
  }) {
    return PostState(
      errorMessage: errorMessage ?? this.errorMessage,
      postsList: postsList ?? this.postsList,
      postsListStatus: postsListStatus ?? this.postsListStatus,
      createPostStatus: createPostStatus ?? this.createPostStatus,
      deletePostStatus: deletePostStatus ?? this.deletePostStatus,
    );
  }
}
