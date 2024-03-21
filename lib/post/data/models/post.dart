import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_raion/post/domain/entity/post.dart';

class PostModel extends PostEntity {
  PostModel({
    required String id,
    required String title,
    required String date,
    required String caption,
    required String category,
    required String imageUrl,
    required String userId,
    required String userName,
  }) : super(
          id: id,
          title: title,
          date: date,
          caption: caption,
          category: category,
          imageUrl: imageUrl,
          userId: userId,
          userName: userName,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      caption: json['caption'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      userId: json['userId'],
      userName: json['userName'],
    );
  }

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id!,
      title: entity.title,
      date: entity.date,
      caption: entity.caption,
      category: entity.category,
      imageUrl: entity.imageUrl,
      userId: entity.userId,
      userName: entity.userName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'caption': caption,
      'category': category,
      'imageUrl': imageUrl,
      'userId': userId,
      'userName': userName,
    };
  }

  factory PostModel.fromDocument(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return PostModel(
      id: data['id'],
      title: data['title'],
      date: data['date'],
      caption: data['caption'],
      category: data['category'],
      imageUrl: data['imageUrl'],
      userId: data['userId'],
      userName: data['userName'],
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      title: title,
      date: date,
      caption: caption,
      category: category,
      imageUrl: imageUrl,
      userId: userId,
      userName: userName,
    );
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? date,
    String? caption,
    String? category,
    String? imageUrl,
    String? userId,
    String? userName,
  }) {
    return PostModel(
      id: id ?? this.id!,
      title: title ?? this.title,
      date: date ?? this.date,
      caption: caption ?? this.caption,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }
}
