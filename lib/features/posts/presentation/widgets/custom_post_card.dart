import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/widgets/dialogs/confirm_deletion_dialog.dart';

import '../../../../core/const/gap.dart';
import '../../domain/entities/post_entity.dart';
import '../bloc/post_bloc.dart';

class CustomPostCard extends StatelessWidget {
  const CustomPostCard({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showConfirmDeletionDialog(
                      context,
                      onConfirm: () {
                        context.read<PostBloc>().add(
                          DeletePostEvent(id: post.id),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            AppGap.h8,
            Flexible(
              child: Text(
                post.body,
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
