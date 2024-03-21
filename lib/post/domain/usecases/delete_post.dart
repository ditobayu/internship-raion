// import 'package:internship_raion/core/usecases/usecase.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class DeletePostUseCase {
  final PostRepository _postRepository;

  DeletePostUseCase(this._postRepository);

  Future<String> call(String postId) {
    return _postRepository.deletePost(postId);
  }
}
