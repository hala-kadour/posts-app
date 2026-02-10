import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_model.dart';

abstract class PostsLocaleDataSource {
  Future<void> cachePosts(List<PostModel> user);
  Future<List<PostModel>> getCachedPosts();
  Future<void> clear();
}

class PostsLocaleDataSourceImpl implements PostsLocaleDataSource {
  final SharedPreferences prefs;

  PostsLocaleDataSourceImpl(this.prefs);

  static const _cachedPostsKey = 'CACHED_POSTS';

  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    await prefs.setString(_cachedPostsKey, postModelToJson(posts));
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final jsonString = prefs.getString(_cachedPostsKey);

    if (jsonString == null) {
      return [];
    }

    final cachedPosts = postModelFromJson(jsonString);
    return cachedPosts;
  }

  @override
  Future<void> clear() async {
    await prefs.remove(_cachedPostsKey);
  }
}
