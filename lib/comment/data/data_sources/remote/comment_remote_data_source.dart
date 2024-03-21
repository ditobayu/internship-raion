import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_raion/comment/data/model/comment.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';
import 'package:internship_raion/comment/data/data_sources/remote/comment_remote_data_source_impl.dart';

abstract class CommentRemoteDataSource {
  factory CommentRemoteDataSource(FirebaseFirestore firestore) =
      CommentRemoteDataSourceImpl;

  Future<List<CommentEntity>> getComments(String postId);
  Future<CommentEntity> writeComment(CommentModel commentModel);
  Future<CommentEntity> editComment(
    CommentModel commentModel,
  );
  Future<String> deleteComment(
    String commentId,
  );
}
