import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/post/domain/entity/post.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
  Future<PostEntity> createPost(PostEntity postEntity, XFile imageFile);
  Future<PostEntity> editPost(
    PostEntity postEntity,
  );
  Future<String> deletePost(
    String postId,
  );
  Future<List<PostEntity>> addRemoveBookmark(
    String postId,
    String userId,
  );
  Future<List<PostEntity>> getBookmarks(
    String userId,
  );
  Future<bool> checkIsBookmarked(
    String postId,
    String userId,
  );
}
