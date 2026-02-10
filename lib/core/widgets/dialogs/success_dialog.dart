import 'package:flutter/material.dart';
import 'package:posts/core/const/gap.dart';

void showSuccessDialog(BuildContext context, void Function()? onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.done, color: Colors.green),
              AppGap.h16,
              Text(
                "Operation completed successfully!",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.green),
              ),
              AppGap.h24,
              TextButton(onPressed: onPressed, child: Text("Okay")),
            ],
          ),
        ),
      );
    },
  );
}
