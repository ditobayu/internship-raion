// import 'package:internship_raion/core/usecases/usecase.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';
import 'package:internship_raion/comment/domain/repository/comment_repository.dart';

class GetCommentUseCase {
  final CommentRepository _commentRepository;

  GetCommentUseCase(this._commentRepository);

  Future<List<CommentEntity>> call(
    String postId,
  ) {
    return _commentRepository.getComments(postId);
  }
}
