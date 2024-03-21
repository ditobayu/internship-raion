import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/post/data/data_sources/remote/post_remote_data_source_impl.dart';
import 'package:internship_raion/post/data/models/post.dart';
import 'package:internship_raion/post/domain/entity/post.dart';

abstract class PostRemoteDataSource {
  factory PostRemoteDataSource(FirebaseFirestore firestore) =
      PostRemoteDataSourceImpl;
  Future<List<PostEntity>> getPosts();
  Future<PostEntity> createPost(PostModel postModel, XFile imageFile);
  Future<PostEntity> editPost(PostModel postModel);
  Future<String> deletePost(String postId);

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
