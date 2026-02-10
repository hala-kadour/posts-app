import 'package:dartz/dartz.dart';
import 'package:posts/core/error/exceptions.dart';

import 'package:posts/core/error/failures.dart';

import 'package:posts/features/posts/domain/entities/post_entity.dart';

import '../../domain/repos/posts_repo.dart';
import '../datasources/posts_locale_data_source.dart';
import '../datasources/posts_remote_data_source.dart';

class PostsRepoImpl implements PostsRepo {
  final PostsRemoteDataSource postsRemoteDataSource;
  final PostsLocaleDataSource postsLocaleDataSource;

  PostsRepoImpl(this.postsRemoteDataSource, this.postsLocaleDataSource);
  @override
  Future<Either<Failure, PostEntity>> createPost(
    String title,
    String body,
  ) async {
    try {
      final post = await postsRemoteDataSource.createPost(title, body);
      final cachedPosts = await postsLocaleDataSource.getCachedPosts();
      await postsLocaleDataSource.cachePosts([...cachedPosts, post]);

      return Right(post);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (_) {
      return Left(UnKnowFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    try {
      await postsRemoteDataSource.deletePost(id);
      final cachedPosts = await postsLocaleDataSource.getCachedPosts();
      final updatedPosts = cachedPosts.where((post) => post.id != id).toList();
      await postsLocaleDataSource.cachePosts(updatedPosts);

      return Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (_) {
      return Left(UnKnowFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    try {
      final posts = await postsRemoteDataSource.getAllPosts();
      await postsLocaleDataSource.cachePosts(posts);

      return Right(posts);
    } on NetworkException catch (e) {
      final cachedPosts = await postsLocaleDataSource.getCachedPosts();
      if (cachedPosts.isNotEmpty) {
        return Right(cachedPosts);
      }
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      // return Left(UnKnowFailure('Something went wrong'));
      return Left(UnKnowFailure(e.toString()));
    }
  }
}
