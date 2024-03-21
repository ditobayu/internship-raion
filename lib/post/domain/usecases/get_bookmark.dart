import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class GetBookmarkUseCase {
  final PostRepository _postRepository;

  GetBookmarkUseCase(this._postRepository);

  Future<List<PostEntity>> call(String userId) {
    return _postRepository.getBookmarks(userId);
  }
}
