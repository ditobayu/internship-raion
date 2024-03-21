// import 'package:internship_raion/core/usecases/usecase.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class EditPostUseCase {
  final PostRepository _postRepository;

  EditPostUseCase(this._postRepository);

  Future<PostEntity> call(PostEntity postEntity) {
    return _postRepository.editPost(postEntity);
  }
}
