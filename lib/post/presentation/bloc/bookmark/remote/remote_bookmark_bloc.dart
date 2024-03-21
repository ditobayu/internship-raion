import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/usecases/add_remove_bookmark.dart';
import 'package:internship_raion/post/domain/usecases/check_is_bookmarked.dart';
import 'package:internship_raion/post/domain/usecases/get_bookmark.dart';

part 'remote_bookmark_event.dart';
part 'remote_bookmark_state.dart';

class RemoteBookmarkBloc
    extends Bloc<RemoteBookmarkEvent, RemoteBookmarkState> {
  final GetBookmarkUseCase _getBookmarkUseCase;
  final AddRemoveBookmarkUseCase _addRemoveBookmarkUseCase;
  final CheckIsBookmarkedUseCase _checkIsBookmarkedUseCase;

  RemoteBookmarkBloc(this._getBookmarkUseCase, this._addRemoveBookmarkUseCase,
      this._checkIsBookmarkedUseCase)
      : super(RemoteBookmarkInitial()) {
    on<RemoteBookmarkEvent>((event, emit) async {
      if (event is GetRemoteBookmark) {
        emit(const RemoteBookmarkLoading());
        final posts = await _getBookmarkUseCase(event.userId);
        emit(RemoteBookmarkDone(posts));
      } else if (event is AddRemoteBookmark) {
        emit(const RemoteBookmarkLoading());
        print("bloc1");
        print(event.postId);
        print(event.userId);
        final posts =
            await _addRemoveBookmarkUseCase(event.postId, event.userId);
        final bool isBookmarked =
            await _checkIsBookmarkedUseCase(event.postId, event.userId);
        print("bloc2");
        print(posts);
        emit(RemoteBookmarkChecked(isBookmarked));
        // emit(RemoteBookmarkInitial());
      } else if (event is CheckIsRemoteBookmark) {
        emit(const RemoteBookmarkLoading());
        print("bloc21");
        print(event.postId);
        print(event.userId);
        final bool isBookmarked =
            await _checkIsBookmarkedUseCase(event.postId, event.userId);
        print("bloc22");
        print(isBookmarked);
        emit(RemoteBookmarkChecked(isBookmarked));
        // emit(RemoteBookmarkInitial());
      }
    });
  }
}
