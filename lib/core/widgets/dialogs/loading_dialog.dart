import 'package:flutter/material.dart';
import 'package:posts/core/const/gap.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
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
              CircularProgressIndicator(),
              AppGap.h16,
              Text(
                "Loading...",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
