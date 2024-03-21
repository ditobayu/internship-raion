import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String? id;
  final String date;
  final String content;
  final String postId;
  final String userId;
  final String userName;
  final String userProfile;

  CommentEntity({
    this.id,
    required this.date,
    required this.postId,
    required this.content,
    required this.userId,
    required this.userName,
    required this.userProfile,
  });

  @override
  List<Object> get props => [id!, date, postId, content, userId, userName];
}
