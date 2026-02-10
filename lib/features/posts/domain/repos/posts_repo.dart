import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post_entity.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, PostEntity>> createPost(String title, String body);
  Future<Either<Failure, Unit>> deletePost(int id);
}
