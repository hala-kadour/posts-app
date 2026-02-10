import 'package:flutter/material.dart';
import 'package:posts/core/const/gap.dart';

void showConfirmDeletionDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: 36,
              ),
              AppGap.h16,
              Text(
                "Delete Post",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              AppGap.h8,
              Text(
                "Are you sure you want to delete this post?",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
              AppGap.h24,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    child: Text(
                      "Delete",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
