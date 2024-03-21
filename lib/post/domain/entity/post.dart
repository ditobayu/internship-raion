import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? id;
  final String title;
  final String date;
  final String caption;
  final String category;
  final String imageUrl;
  final String userId;
  final String userName;

  PostEntity({
    this.id,
    required this.title,
    required this.date,
    required this.category,
    required this.caption,
    required this.imageUrl,
    required this.userId,
    required this.userName,
  });

  @override
  List<Object> get props =>
      [id!, title, date, caption, imageUrl, userId, userName];
}
