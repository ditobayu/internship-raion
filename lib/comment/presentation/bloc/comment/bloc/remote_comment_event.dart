part of 'remote_comment_bloc.dart';

sealed class RemoteCommentEvent extends Equatable {
  const RemoteCommentEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteComment extends RemoteCommentEvent {
  final String postId;
  const GetRemoteComment(this.postId);

  @override
  List<Object> get props => [postId];
}

final class SendRemoteComment extends RemoteCommentEvent {
  final CommentEntity comment;
  const SendRemoteComment(this.comment);

  @override
  List<Object> get props => [comment];
}
