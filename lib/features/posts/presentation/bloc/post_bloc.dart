import 'package:bloc/bloc.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/usecases/create_post_use_case.dart';
import '../../domain/usecases/delete_post__use_case.dart';
import '../../domain/usecases/get_all_posts_use_case.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  final CreatePostUseCase createPostUseCase;
  final DeletePostUseCase deletePostUseCase;
  PostBloc({
    required this.getAllPostsUseCase,
    required this.createPostUseCase,
    required this.deletePostUseCase,
  }) : super(PostState()) {
    on<GetAllPostsEvent>((event, emit) async {
      emit(state.copyWith(postsListStatus: PostStatus.loading));
      final result = await getAllPostsUseCase();
      result.fold(
        (error) => emit(
          state.copyWith(
            postsListStatus: PostStatus.error,
            errorMessage: error.message,
          ),
        ),
        (posts) => emit(
          state.copyWith(postsListStatus: PostStatus.success, postsList: posts),
        ),
      );
    });
    on<CreatePostEvent>((event, emit) async {
      emit(state.copyWith(createPostStatus: PostStatus.loading));
      final result = await createPostUseCase(
        CreatePostParam(event.title, event.body),
      );

      result.fold(
        (error) => emit(
          state.copyWith(
            createPostStatus: PostStatus.error,
            errorMessage: error.message,
          ),
        ),
        (post) => emit(
          state.copyWith(
            createPostStatus: PostStatus.success,
            postsList: [...state.postsList, post],
          ),
        ),
      );
    });
    on<DeletePostEvent>((event, emit) async {
      emit(state.copyWith(deletePostStatus: PostStatus.loading));
      final result = await deletePostUseCase(event.id);
      result.fold(
        (error) => emit(
          state.copyWith(
            deletePostStatus: PostStatus.error,
            errorMessage: error.message,
          ),
        ),
        (success) => emit(state.copyWith(deletePostStatus: PostStatus.success)),
      );
    });
  }
}
