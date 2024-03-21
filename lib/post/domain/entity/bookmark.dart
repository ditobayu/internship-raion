import 'package:equatable/equatable.dart';

class BookmarkEntity extends Equatable {
  final String? id;
  final String userId;
  final String postId;

  BookmarkEntity({
    this.id,
    required this.userId,
    required this.postId,
  });

  @override
  List<Object?> get props => [id, userId, postId];
}
