import 'package:flutter/material.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBackAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            width: 0.2,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 24.0),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56.0);
}
