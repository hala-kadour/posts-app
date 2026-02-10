import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/post_entity.dart';
import '../repos/posts_repo.dart';

class CreatePostUseCase
    extends UseCase<Future<Either<Failure, PostEntity>>, CreatePostParam> {
  final PostsRepo postsRepo;
  CreatePostUseCase(this.postsRepo);

  @override
  Future<Either<Failure, PostEntity>> call(CreatePostParam param) {
    return postsRepo.createPost(param.title, param.body);
  }
}

class CreatePostParam {
  final String title;
  final String body;
  CreatePostParam(this.title, this.body);
}
