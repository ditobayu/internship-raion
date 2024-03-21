import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';
import 'package:internship_raion/comment/domain/usecases/create_comment.dart';
import 'package:internship_raion/comment/domain/usecases/get_comments.dart';

part 'remote_comment_event.dart';
part 'remote_comment_state.dart';

class RemoteCommentBloc extends Bloc<RemoteCommentEvent, RemoteCommentState> {
  final GetCommentUseCase _getCommentUseCase;
  final CreateCommentUseCase _createCommentUseCase;

  RemoteCommentBloc(this._getCommentUseCase, this._createCommentUseCase)
      : super(RemoteCommentInitial()) {
    on<RemoteCommentEvent>((event, emit) async {
      if (event is GetRemoteComment) {
        emit(const RemoteCommentLoading());
        final posts = await _getCommentUseCase(event.postId);
        emit(RemoteCommentDone(posts));
      } else if (event is SendRemoteComment) {
        emit(const RemoteCommentLoading());
        print("bloc1");
        print(event.comment);
        await _createCommentUseCase(event.comment);
        final posts = await _getCommentUseCase(event.comment.postId);
        emit(RemoteCommentDone(posts));
      }
    });
  }
}
