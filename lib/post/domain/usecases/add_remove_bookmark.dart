import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class AddRemoveBookmarkUseCase {
  final PostRepository _postRepository;

  AddRemoveBookmarkUseCase(this._postRepository);

  Future<List<PostEntity>> call(String postId, String userId) {
    return _postRepository.addRemoveBookmark(postId, userId);
  }
}
