import 'package:dio/dio.dart';

import '../../../../core/error/dio_error_handler.dart';
import '../models/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<void> deletePost(int id);
  Future<PostModel> createPost(String title, String body);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final Dio dio;
  PostsRemoteDataSourceImpl(this.dio);

  @override
  Future<PostModel> createPost(String title, String body) async {
    try {
      final response = await dio.post(
        '/posts',
        data: {'title': title, 'body': body, 'userId': 1},
      );
      return PostModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> deletePost(int id) async {
    try {
      await dio.delete('/posts/$id');
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await dio.get('/posts');
      return postModelFromList(response.data);
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
