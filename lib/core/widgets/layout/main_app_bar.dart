import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            width: 0.2,
          ),
        ),
      ),
      child: AppBar(
        title: const Text('All Posts'),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.search)],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56.0);
}
