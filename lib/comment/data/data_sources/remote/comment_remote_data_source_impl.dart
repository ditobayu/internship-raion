import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_raion/comment/data/data_sources/remote/comment_remote_data_source.dart';
import 'package:internship_raion/comment/data/model/comment.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final FirebaseFirestore _firestore;

  CommentRemoteDataSourceImpl(this._firestore);

  @override
  Future<String> deleteComment(String commentId) async {
    try {
      await _firestore.collection('comments').doc(commentId).delete();
      return 'Comment deleted successfully';
    } catch (e) {
      throw Exception('Failed to delete comment: $e');
    }
  }

  @override
  Future<CommentModel> editComment(CommentModel commentModel) async {
    try {
      await _firestore
          .collection('comments')
          .doc(commentModel.id)
          .update(commentModel.toJson());
      return commentModel;
    } catch (e) {
      throw Exception('Failed to edit comment: $e');
    }
  }

  @override
  Future<CommentModel> writeComment(CommentModel commentModel) async {
    try {
      print("dsimpl1");
      print(commentModel);
      print(commentModel.toJson());
      final docRef =
          await _firestore.collection('comments').add(commentModel.toJson());
      final commentId = docRef.id;
      print("dsimpl2");
      print(commentModel.copyWith(id: commentId));
      return commentModel.copyWith(id: commentId);
    } catch (e) {
      throw Exception('Failed to write comment: $e');
    }
  }

  @override
  Future<List<CommentModel>> getComments(String postId) async {
    try {
      final querySnapshot = await _firestore
          .collection('comments')
          .where('postId', isEqualTo: postId)
          .get();
      final comments = querySnapshot.docs
          .map((doc) => CommentModel.fromMap(doc.data()))
          .toList();
      return comments;
    } catch (e) {
      throw Exception('Failed to get comments: $e');
    }
  }
}
