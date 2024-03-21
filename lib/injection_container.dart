import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internship_raion/comment/data/data_sources/remote/comment_remote_data_source.dart';
import 'package:internship_raion/comment/data/repository/comment_repository_impl.dart';
import 'package:internship_raion/comment/domain/repository/comment_repository.dart';
import 'package:internship_raion/comment/domain/usecases/create_comment.dart';
import 'package:internship_raion/comment/domain/usecases/get_comments.dart';
import 'package:internship_raion/post/data/data_sources/remote/post_remote_data_source.dart';
import 'package:internship_raion/post/data/repository/post_repository_impl.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';
import 'package:internship_raion/post/domain/usecases/add_remove_bookmark.dart';
import 'package:internship_raion/post/domain/usecases/check_is_bookmarked.dart';
import 'package:internship_raion/post/domain/usecases/create_post.dart';
import 'package:internship_raion/post/domain/usecases/delete_post.dart';
import 'package:internship_raion/post/domain/usecases/edit_post.dart';
import 'package:internship_raion/post/domain/usecases/get_bookmark.dart';
import 'package:internship_raion/post/domain/usecases/get_post.dart';
import 'package:internship_raion/post/presentation/bloc/post/remote/remote_post_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  // Data Source
  sl.registerSingleton<PostRemoteDataSource>(PostRemoteDataSource(sl()));
  sl.registerSingleton<CommentRemoteDataSource>(CommentRemoteDataSource(sl()));

  sl.registerSingleton<PostRepository>(PostRepositoryImpl(sl()));
  sl.registerSingleton<CommentRepository>(CommentRepositoryImpl(sl()));

  //UseCases Bookmark
  sl.registerSingleton<GetBookmarkUseCase>(GetBookmarkUseCase(sl()));
  sl.registerSingleton<CheckIsBookmarkedUseCase>(
      CheckIsBookmarkedUseCase(sl()));
  sl.registerSingleton<AddRemoveBookmarkUseCase>(
      AddRemoveBookmarkUseCase(sl()));

  //UseCases Comment
  sl.registerSingleton<GetCommentUseCase>(GetCommentUseCase(sl()));
  sl.registerSingleton<CreateCommentUseCase>(CreateCommentUseCase(sl()));
  //UseCases
  sl.registerSingleton<GetPostUseCase>(GetPostUseCase(sl()));
  sl.registerSingleton<CreatePostUseCase>(CreatePostUseCase(sl()));
  sl.registerSingleton<EditPostUseCase>(EditPostUseCase(sl()));
  sl.registerSingleton<DeletePostUseCase>(DeletePostUseCase(sl()));

  // sl.registerSingleton<GetSavedPostUseCase>(
  //   GetSavedPostUseCase(sl())
  // );

  // sl.registerSingleton<SavePostUseCase>(
  //   SavePostUseCase(sl())
  // );

  // sl.registerSingleton<RemovePostUseCase>(
  //   RemovePostUseCase(sl())
  // );

  //Blocs
  sl.registerFactory<RemotePostBloc>(
      () => RemotePostBloc(sl(), sl(), sl(), sl()));

  // sl.registerFactory<LocalPostBloc>(
  //   ()=> LocalPostBloc(sl(),sl(),sl())
  // );
}
