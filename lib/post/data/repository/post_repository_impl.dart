import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/post/data/data_sources/remote/post_remote_data_source.dart';
import 'package:internship_raion/post/data/models/post.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _postRemoteDataSource;

  PostRepositoryImpl(this._postRemoteDataSource);

  @override
  Future<List<PostEntity>> getPosts() => _postRemoteDataSource.getPosts();

  @override
  Future<PostEntity> createPost(PostEntity postEntity, XFile imageFile) async {
    return await _postRemoteDataSource.createPost(
        PostModel.fromEntity(postEntity), imageFile);
  }

  @override
  Future<String> deletePost(String postId) {
    return _postRemoteDataSource.deletePost(postId);
  }

  @override
  Future<PostEntity> editPost(PostEntity postEntity) {
    return _postRemoteDataSource.editPost(PostModel.fromEntity(postEntity));
  }

  @override
  Future<List<PostEntity>> addRemoveBookmark(String postId, String userId) =>
      _postRemoteDataSource.addRemoveBookmark(postId, userId);

  @override
  Future<List<PostEntity>> getBookmarks(String userId) =>
      _postRemoteDataSource.getBookmarks(userId);

  @override
  Future<bool> checkIsBookmarked(String postId, String userId) =>
      _postRemoteDataSource.checkIsBookmarked(postId, userId);
}
