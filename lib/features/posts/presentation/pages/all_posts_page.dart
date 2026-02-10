import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/presentation/bloc/post_bloc_state_handler.dart';
import 'package:posts/features/posts/presentation/pages/create_post_page.dart';

import '../../../../core/widgets/layout/main_app_bar.dart';
import '../bloc/post_bloc.dart';

class AllPostsPage extends StatefulWidget {
  const AllPostsPage({super.key});

  @override
  State<AllPostsPage> createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  @override
  void didChangeDependencies() {
    context.read<PostBloc>().add(GetAllPostsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatePostPage()),
        ),
        child: Icon(Icons.add),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listenWhen: (previous, current) =>
            previous.deletePostStatus != current.deletePostStatus,
        listener: (context, state) {
          PostBlocStateHandler.deletePostListener(state, context);
        },
        buildWhen: (previous, current) =>
            previous.postsListStatus != current.postsListStatus,
        builder: (context, state) {
          return PostBlocStateHandler.getAllPosts(state);
        },
      ),
    );
  }
}
