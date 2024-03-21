import 'package:internship_raion/post/domain/entity/bookmark.dart';

class BookmarkModel extends BookmarkEntity {
  BookmarkModel({
    required String id,
    required String userId,
    required String postId,
  }) : super(
          id: id,
          userId: userId,
          postId: postId,
        );
}
