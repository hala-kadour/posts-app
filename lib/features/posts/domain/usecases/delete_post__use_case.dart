import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../repos/posts_repo.dart';

class DeletePostUseCase extends UseCase<Future<Either<Failure, Unit>>, int> {
  final PostsRepo postsRepo;
  DeletePostUseCase(this.postsRepo);

  @override
  Future<Either<Failure, Unit>> call(int param) {
    return postsRepo.deletePost(param);
  }
}
