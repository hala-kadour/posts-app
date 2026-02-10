import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/dio_client.dart';
import 'features/posts/data/datasources/posts_locale_data_source.dart';
import 'features/posts/data/datasources/posts_remote_data_source.dart';
import 'features/posts/data/repos/posts_repo_impl.dart';
import 'features/posts/domain/repos/posts_repo.dart';
import 'features/posts/domain/usecases/create_post_use_case.dart';
import 'features/posts/domain/usecases/delete_post__use_case.dart';
import 'features/posts/domain/usecases/get_all_posts_use_case.dart';
import 'features/posts/presentation/bloc/post_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  // Dio
  sl.registerLazySingleton(() => DioClient().dio);

  // Data sources
  sl.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<PostsLocaleDataSource>(
    () => PostsLocaleDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<PostsRepo>(() => PostsRepoImpl(sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => CreatePostUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => PostBloc(
      getAllPostsUseCase: sl(),
      createPostUseCase: sl(),
      deletePostUseCase: sl(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
