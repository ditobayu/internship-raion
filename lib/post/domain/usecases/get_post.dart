// import 'package:internship_raion/core/usecases/usecase.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class GetPostUseCase {
  final PostRepository _postRepository;

  GetPostUseCase(this._postRepository);

  Future<List<PostEntity>> call({void params}) {
    return _postRepository.getPosts();
  }
}
