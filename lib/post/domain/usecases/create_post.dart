// import 'package:internship_raion/core/usecases/usecase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class CreatePostUseCase {
  final PostRepository _postRepository;

  CreatePostUseCase(this._postRepository);

  Future<PostEntity> call(PostEntity postEntity, XFile imageFile) {
    return _postRepository.createPost(postEntity, imageFile);
  }
}
