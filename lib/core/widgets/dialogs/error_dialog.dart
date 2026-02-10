import 'package:flutter/material.dart';
import 'package:posts/core/const/gap.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, color: Colors.red),
              AppGap.h16,
              Text(
                "The operation failed",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.red),
              ),
              AppGap.h8,
              Text(errorMessage, style: Theme.of(context).textTheme.labelSmall),
              AppGap.h24,
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
        ),
      );
    },
  );
}
