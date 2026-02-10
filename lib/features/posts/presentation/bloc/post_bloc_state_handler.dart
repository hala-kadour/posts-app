import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/dialogs/error_dialog.dart';
import '../../../../core/widgets/dialogs/loading_dialog.dart';
import '../../../../core/widgets/dialogs/success_dialog.dart';
import '../widgets/custom_post_card.dart';
import 'post_bloc.dart';

class PostBlocStateHandler {
  // Get All Posts
  static Widget getAllPosts(PostState state) {
    if (state.postsListStatus == PostStatus.success) {
      return GridView.builder(
        itemCount: state.postsList.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CustomPostCard(post: state.postsList[index]);
        },
      );
    } else if (state.postsListStatus == PostStatus.error) {
      return Center(child: Text(state.errorMessage));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  // Create Post
  static void createPostListener(PostState state, BuildContext context) {
    if (state.createPostStatus == PostStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createPostStatus == PostStatus.success) {
      Navigator.pop(context);
      showSuccessDialog(context, () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
      context.read<PostBloc>().add(GetAllPostsEvent());
    } else if (state.createPostStatus == PostStatus.error) {
      Navigator.pop(context);
      showErrorDialog(context, state.errorMessage);
    }
  }

  // Delete Post
  static void deletePostListener(PostState state, BuildContext context) {
    if (state.deletePostStatus == PostStatus.loading) {
      showLoadingDialog(context);
    } else if (state.deletePostStatus == PostStatus.success) {
      Navigator.pop(context);
      showSuccessDialog(context, () {
        Navigator.pop(context);
      });
      context.read<PostBloc>().add(GetAllPostsEvent());
    } else if (state.deletePostStatus == PostStatus.error) {
      Navigator.pop(context);
      showErrorDialog(context, state.errorMessage);
    }
  }
}
