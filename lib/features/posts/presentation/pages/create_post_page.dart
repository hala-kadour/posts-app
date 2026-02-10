import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/presentation/bloc/post_bloc_state_handler.dart';

import '../../../../core/const/gap.dart';
import '../../../../core/widgets/layout/custom_back_app_bar.dart';
import '../bloc/post_bloc.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _bodyCtrl;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _bodyCtrl = TextEditingController();
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(title: "Add Post"),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title"),
              AppGap.h8,
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(hintText: "Enter post title"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
              ),
              AppGap.h24,
              Text("Body"),
              AppGap.h8,
              TextFormField(
                controller: _bodyCtrl,
                decoration: InputDecoration(
                  hintText: "Write your content here...",
                ),
                maxLines: 10,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Body is required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocListener<PostBloc, PostState>(
        listenWhen: (previous, current) =>
            previous.createPostStatus != current.createPostStatus,
        listener: (context, state) {
          PostBlocStateHandler.createPostListener(state, context);
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 16.0,
            end: 16.0,
            bottom: 16.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  context.read<PostBloc>().add(
                    CreatePostEvent(
                      title: _titleCtrl.text,
                      body: _bodyCtrl.text,
                    ),
                  );
                }
              },
              child: const Text("Save Post"),
            ),
          ),
        ),
      ),
    );
  }
}
