part of 'remote_post_bloc.dart';

sealed class RemotePostState extends Equatable {
  const RemotePostState();

  @override
  List<Object> get props => [];
}

final class RemotePostInitial extends RemotePostState {
  const RemotePostInitial();
}

final class RemotePostLoading extends RemotePostState {
  const RemotePostLoading();
}

final class RemotePostLoaded extends RemotePostState {
  final List<PostEntity> posts;
  const RemotePostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

final class RemotePostAdded extends RemotePostState {
  final PostEntity post;
  const RemotePostAdded(this.post);
  @override
  List<Object> get props => [post];
}

final class RemotePostEdited extends RemotePostState {
  final PostEntity post;
  const RemotePostEdited(this.post);
  @override
  List<Object> get props => [post];
}

final class RemotePostDeleted extends RemotePostState {
  final String message;
  const RemotePostDeleted(this.message);
  @override
  List<Object> get props => [message];
}

final class RemotePostError extends RemotePostState {
  final String message;
  const RemotePostError(this.message);
  @override
  List<Object> get props => [message];
}
