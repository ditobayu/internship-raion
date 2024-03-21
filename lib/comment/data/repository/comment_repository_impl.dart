import 'package:internship_raion/comment/data/data_sources/remote/comment_remote_data_source.dart';
import 'package:internship_raion/comment/data/model/comment.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';
import 'package:internship_raion/comment/domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource _commentRemoteDataSource;

  CommentRepositoryImpl(this._commentRemoteDataSource);

  @override
  Future<String> deleteComment(String commentId) =>
      _commentRemoteDataSource.deleteComment(commentId);

  @override
  Future<CommentEntity> editComment(CommentEntity commentEntity) =>
      _commentRemoteDataSource
          .editComment(CommentModel.fromEntity(commentEntity));

  @override
  Future<List<CommentEntity>> getComments(String postId) =>
      _commentRemoteDataSource.getComments(postId);

  @override
  Future<CommentEntity> writeComment(CommentEntity commentEntity) =>
      _commentRemoteDataSource
          .writeComment(CommentModel.fromEntity(commentEntity));
}
