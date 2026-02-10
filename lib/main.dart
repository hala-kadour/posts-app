import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/presentation/bloc/post_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/posts/presentation/pages/all_posts_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<PostBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(),
        home: AllPostsPage(),
      ),
    );
  }
}
