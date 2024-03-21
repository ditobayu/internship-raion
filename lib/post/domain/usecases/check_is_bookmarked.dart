import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class CheckIsBookmarkedUseCase {
  final PostRepository _postRepository;

  CheckIsBookmarkedUseCase(this._postRepository);

  Future<bool> call(String postId, String userId) {
    return _postRepository.checkIsBookmarked(postId, userId);
  }
}
