// import 'package:internship_raion/core/usecases/usecase.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';
import 'package:internship_raion/comment/domain/repository/comment_repository.dart';

class CreateCommentUseCase {
  final CommentRepository _commentRepository;

  CreateCommentUseCase(this._commentRepository);

  Future<CommentEntity> call(
    CommentEntity commentEntity,
  ) {
    return _commentRepository.writeComment(commentEntity);
  }
}
