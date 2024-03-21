import 'package:flutter/material.dart';
import 'package:internship_raion/blocs/blocs.dart';
import 'package:internship_raion/comment/presentation/pages/comment/comment_page.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/presentation/pages/bookmark/bookmark_page.dart';
import 'package:internship_raion/post/presentation/pages/create_post/create_post_page.dart';
import 'package:internship_raion/post/presentation/pages/home/home_page.dart';
import 'package:internship_raion/post/presentation/pages/post_detail/post_detail_page.dart';
import 'package:internship_raion/ui/pages/pages.dart';
import 'package:internship_raion/user/presentation/pages/profile_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(OnboardingPage(), settings);
      case '/sign-in':
        return _materialRoute(SignInPage(), settings);
      case '/sign-up':
        return _materialRoute(SignUpPage(), settings);
      case '/home':
        return _materialRoute(HomePage(), settings);

      case '/post-detail':
        return _materialRoute(
            PostDetailPage(post: settings.arguments as PostEntity), settings);

      case '/create-post':
        return _materialRoute(CreatePostPage(), settings);

      case '/bookmark':
        return _materialRoute(BookmarkPage(), settings);
      case '/profile':
        return _materialRoute(ProfilePage(), settings);
      case '/comment':
        return _materialRoute(
            CommentPage(
              post: settings.arguments as PostEntity,
            ),
            settings);

      default:
        return _materialRoute(CreatePostPage(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings settings) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
