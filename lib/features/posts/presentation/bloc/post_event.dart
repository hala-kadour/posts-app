part of 'post_bloc.dart';

class PostEvent {}

class GetAllPostsEvent extends PostEvent {}

class CreatePostEvent extends PostEvent {
  final String title;
  final String body;

  CreatePostEvent({required this.title, required this.body});
}

class DeletePostEvent extends PostEvent {
  final int id;
  DeletePostEvent({required this.id});
}
