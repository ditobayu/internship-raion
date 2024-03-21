import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/post/data/data_sources/remote/post_remote_data_source.dart';
import 'package:internship_raion/post/data/models/post.dart';
import 'package:internship_raion/post/domain/entity/post.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final FirebaseFirestore _firestore;

  PostRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<PostModel>> getPosts() {
    return _firestore.collection('posts').get().then((value) {
      return value.docs.map((e) {
        final data = e.data();
        data['id'] = e.id;
        return PostModel.fromJson(data);
      }).toList();
    });
  }

  @override
  Future<PostEntity> createPost(PostModel postModel, XFile imageFile) async {
    final file = File(imageFile.path);
    final fileName = '${postModel.title}_${postModel.date}';

    final storageRef =
        FirebaseStorage.instance.ref().child('post-images/$fileName');

    final uploadTask = storageRef.putFile(file);
    // uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
    //   switch (taskSnapshot.state) {
    //     case TaskState.running:
    //       final progress =
    //           100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
    //       print("Upload is $progress% complete.");
    //       break;
    //     case TaskState.paused:
    //       print("Upload is paused.");
    //       break;
    //     case TaskState.canceled:
    //       print("Upload was canceled");
    //       break;
    //     case TaskState.error:
    //       // Handle unsuccessful uploads
    //       break;
    //     case TaskState.success:
    //       // Handle successful uploads on complete
    //       // ...
    //       break;
    //   }
    // });
    String imageUrl = "";
    PostModel postModelWithImageUrl;
    await uploadTask.then((TaskSnapshot taskSnapshot) async {
      if (taskSnapshot.state == TaskState.success) {
        final downloadUrl = await taskSnapshot.ref.getDownloadURL();
        print("Download URL: $downloadUrl");
        imageUrl = downloadUrl;
      }
    });

    postModelWithImageUrl = PostModel(
      date: postModel.date,
      category: postModel.category,
      userId: postModel.userId,
      userName: postModel.userName,
      id: postModel.id!,
      title: postModel.title,
      caption: postModel.caption,
      imageUrl: imageUrl,
    );
    return _firestore
        .collection('posts')
        .add(postModelWithImageUrl.toJson())
        .then((value) {
      return postModelWithImageUrl;
    });
  }

  @override
  Future<String> deletePost(String postId) {
    return _firestore.collection('posts').doc(postId).delete().then((value) {
      return postId;
    });
  }

  @override
  Future<PostEntity> editPost(PostModel postModel) {
    return _firestore
        .collection('posts')
        .doc(postModel.id)
        .update(postModel.toJson())
        .then((value) {
      return postModel;
    });
  }

  @override
  Future<List<PostEntity>> addRemoveBookmark(String postId, String userId) {
    print('addRemoveBookmark1');
    return _firestore
        .collection('bookmarks')
        .where('postId', isEqualTo: postId)
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        // Data already exists, delete the existing bookmark
        print('addRemoveBookmark2');
        final bookmarkId = value.docs.first.id;
        return _firestore
            .collection('bookmarks')
            .doc(bookmarkId)
            .delete()
            .then((_) {
          // Return the updated bookmarks
          print(userId);
          print('addRemoveBookmark2.1');
          return getBookmarks(userId);
        });
      } else {
        print('addRemoveBookmark3');
        // Data does not exist, add the bookmark
        return _firestore.collection('bookmarks').add({
          'postId': postId,
          'userId': userId,
        }).then((_) {
          // Return the updated bookmarks
          print('addRemoveBookmark3.2');
          print(userId);
          return getBookmarks(userId);
        });
      }
    });
  }

  @override
  Future<List<PostEntity>> getBookmarks(String userId) {
    print('getBookmarks1');
    return _firestore
        .collection('bookmarks')
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        // No bookmarks found
        return [];
      } else {
        return value.docs.map((e) {
          return e.data()['postId'];
        }).toList();
      }
    }).then((value) {
      if (value.isEmpty) {
        // No bookmarks found
        print('getBookmarks3');
        return [];
      } else {
        return _firestore
            .collection('posts')
            .where(FieldPath.documentId, whereIn: value)
            .get()
            .then((value) {
          print('getBookmarks2');
          return value.docs.map((e) {
            final data = e.data();
            data['id'] = e.id;
            return PostModel.fromJson(data);
          }).toList();
        });
      }
    });
  }

  @override
  Future<bool> checkIsBookmarked(String postId, String userId) {
    return _firestore
        .collection('bookmarks')
        .where('postId', isEqualTo: postId)
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) {
      return value.docs.isNotEmpty;
    });
  }
}
