part of 'post_api_bloc.dart';

class PostApiEvent extends BaseEquatable {}

class PostApiInitialEvent extends PostApiEvent {}

class PostSubmitEvent extends PostApiEvent {
  final int userId;
  final String title;
  final String body;

  PostSubmitEvent(this.userId, this.title, this.body);
}
