import 'package:internship_raion/comment/domain/entity/comment.dart';

abstract class CommentRepository {
  Future<List<CommentEntity>> getComments(String postId);
  Future<CommentEntity> writeComment(CommentEntity commentEntity);
  Future<CommentEntity> editComment(
    CommentEntity commentEntity,
  );
  Future<String> deleteComment(
    String commentId,
  );
}
