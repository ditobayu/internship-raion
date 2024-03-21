part of 'remote_comment_bloc.dart';

sealed class RemoteCommentState extends Equatable {
  const RemoteCommentState();

  @override
  List<Object> get props => [];
}

final class RemoteCommentInitial extends RemoteCommentState {}

final class RemoteCommentLoading extends RemoteCommentState {
  const RemoteCommentLoading();
}

final class RemoteCommentDone extends RemoteCommentState {
  final List<CommentEntity> comments;
  const RemoteCommentDone(this.comments);
  @override
  List<Object> get props => [comments];
}

final class RemoteCommentError extends RemoteCommentState {
  final String error;
  const RemoteCommentError(this.error);
}
