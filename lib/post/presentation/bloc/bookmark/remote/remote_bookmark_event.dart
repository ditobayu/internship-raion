part of 'remote_bookmark_bloc.dart';

sealed class RemoteBookmarkEvent extends Equatable {
  const RemoteBookmarkEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteBookmark extends RemoteBookmarkEvent {
  final String userId;
  const GetRemoteBookmark(this.userId);
}

final class AddRemoteBookmark extends RemoteBookmarkEvent {
  final String userId;
  final String postId;
  const AddRemoteBookmark(this.postId, this.userId);
}

final class CheckIsRemoteBookmark extends RemoteBookmarkEvent {
  final String userId;
  final String postId;
  const CheckIsRemoteBookmark(this.postId, this.userId);
}
