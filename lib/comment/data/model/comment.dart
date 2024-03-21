import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required String id,
    required String date,
    required String postId,
    required String content,
    required String userId,
    required String userName,
    required String userProfile,
  }) : super(
          id: id,
          date: date,
          postId: postId,
          content: content,
          userId: userId,
          userName: userName,
          userProfile: userProfile,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      date: json['date'],
      postId: json['postId'],
      content: json['content'],
      userId: json['userId'],
      userName: json['userName'],
      userProfile: json['userProfile'],
    );
  }

  factory CommentModel.fromEntity(CommentEntity entity) {
    return CommentModel(
      id: entity.id!,
      date: entity.date,
      postId: entity.postId,
      content: entity.content,
      userId: entity.userId,
      userName: entity.userName,
      userProfile: entity.userProfile,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'postId': postId,
      'content': content,
      'userId': userId,
      'userName': userName,
      'userProfile': userProfile,
    };
  }

  factory CommentModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return CommentModel(
      id: doc.id,
      date: doc['date'],
      postId: doc['postId'],
      content: doc['content'],
      userId: doc['userId'],
      userName: doc['userName'],
      userProfile: doc['userProfile'],
    );
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'],
      date: map['date'],
      postId: map['postId'],
      content: map['content'],
      userId: map['userId'],
      userName: map['userName'],
      userProfile: map['userProfile'],
    );
  }
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      date: date,
      postId: postId,
      content: content,
      userId: userId,
      userName: userName,
      userProfile: userProfile,
    );
  }

  CommentModel copyWith({
    String? id,
    String? date,
    String? postId,
    String? content,
    String? userId,
    String? userName,
    String? userProfile,
  }) {
    return CommentModel(
      id: id!,
      date: date ?? this.date,
      postId: postId ?? this.postId,
      content: content ?? this.content,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
