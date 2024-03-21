import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/core/error/failure.dart';
import 'package:internship_raion/core/resources/data_state.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/usecases/create_post.dart';
import 'package:internship_raion/post/domain/usecases/delete_post.dart';
import 'package:internship_raion/post/domain/usecases/edit_post.dart';
import 'package:internship_raion/post/domain/usecases/get_post.dart';

part 'remote_post_event.dart';
part 'remote_post_state.dart';

class RemotePostBloc extends Bloc<RemotePostEvent, RemotePostState> {
  final GetPostUseCase _getPostUseCase;
  final CreatePostUseCase _createPostUseCase;
  final EditPostUseCase _editPostUseCase;
  final DeletePostUseCase _deletePostUseCase;

  RemotePostBloc(this._getPostUseCase, this._createPostUseCase,
      this._deletePostUseCase, this._editPostUseCase)
      : super(RemotePostInitial()) {
    on<RemotePostEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetRemotePost) {
        emit(const RemotePostLoading());
        final posts = await _getPostUseCase();
        emit(RemotePostLoaded(posts));
      } else if (event is UpdateRemotePost) {
        emit(const RemotePostLoading());
        final posts = await _editPostUseCase(event.post);
        emit(RemotePostEdited(posts));
      } else if (event is CreateRemotePost) {
        emit(const RemotePostLoading());
        final post = await _createPostUseCase(event.post, event.imageFile);
        final posts = await _getPostUseCase();
        emit(RemotePostLoaded(posts));
      } else if (event is DeleteRemotePost) {
        emit(const RemotePostLoading());
        final message = await _deletePostUseCase(event.postId);
        emit(RemotePostDeleted(message));
      }
    });
  }
}
