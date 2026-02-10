import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/no_param_use_case.dart';
import '../entities/post_entity.dart';
import '../repos/posts_repo.dart';

class GetAllPostsUseCase
    extends NoParamUseCase<Future<Either<Failure, List<PostEntity>>>> {
  final PostsRepo postsRepo;
  GetAllPostsUseCase(this.postsRepo);
  @override
  Future<Either<Failure, List<PostEntity>>> call() {
    return postsRepo.getAllPosts();
  }
}
