part of 'remote_bookmark_bloc.dart';

sealed class RemoteBookmarkState extends Equatable {
  const RemoteBookmarkState();

  @override
  List<Object> get props => [];
}

final class RemoteBookmarkInitial extends RemoteBookmarkState {}

final class RemoteBookmarkLoading extends RemoteBookmarkState {
  const RemoteBookmarkLoading();
}

final class RemoteBookmarkDone extends RemoteBookmarkState {
  final List<PostEntity> posts;
  const RemoteBookmarkDone(this.posts);
  @override
  List<Object> get props => [posts];
}

final class RemoteBookmarkChecked extends RemoteBookmarkState {
  final bool isBookmarked;
  const RemoteBookmarkChecked(this.isBookmarked);
  @override
  List<Object> get props => [isBookmarked];
}

final class RemoteBookmarkError extends RemoteBookmarkState {
  final String message;
  const RemoteBookmarkError(this.message);
  @override
  List<Object> get props => [message];
}
