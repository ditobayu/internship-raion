part of 'remote_post_bloc.dart';

sealed class RemotePostEvent extends Equatable {
  const RemotePostEvent();

  @override
  List<Object> get props => [];
}

final class GetRemotePost extends RemotePostEvent {
  const GetRemotePost();
}

final class UpdateRemotePost extends RemotePostEvent {
  final PostEntity post;
  const UpdateRemotePost(this.post);

  @override
  List<Object> get props => [post];
}

final class CreateRemotePost extends RemotePostEvent {
  final PostEntity post;
  final XFile imageFile;
  const CreateRemotePost(this.post, this.imageFile);

  @override
  List<Object> get props => [post];
}

final class DeleteRemotePost extends RemotePostEvent {
  final String postId;

  const DeleteRemotePost(this.postId);

  @override
  List<Object> get props => [postId];
}
