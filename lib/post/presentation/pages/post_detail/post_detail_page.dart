import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_raion/blocs/user/user_bloc.dart';
import 'package:internship_raion/comment/presentation/bloc/comment/bloc/remote_comment_bloc.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/presentation/bloc/bookmark/remote/remote_bookmark_bloc.dart';
import 'package:internship_raion/shared/shared.dart';

class PostDetailPage extends StatefulWidget {
  final PostEntity post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late RemoteBookmarkBloc _remoteBookmarkBloc;
  late UserBloc _userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _remoteBookmarkBloc = BlocProvider.of<RemoteBookmarkBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    if (_userBloc.state is UserLoaded) {
      _remoteBookmarkBloc.add(CheckIsRemoteBookmark(
          widget.post.id!, (_userBloc.state as UserLoaded).user.getId()));
    }
    print(widget.post.id);
    // context.read<RemoteBookmarkBloc>().add(
    //     CheckIsRemoteBookmark(
    //         post.id!, userState.user.getId()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: blueColor,
      title: Text(
        'Information Title',
        style: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.pop(context);

          if (_userBloc.state is UserLoaded) {
            _remoteBookmarkBloc.add(GetRemoteBookmark(
                (_userBloc.state as UserLoaded).user.getId()));
          }
        },
      ),
      iconTheme: const IconThemeData(color: Colors.white), // Add this line
    );
  }

  _buildBody(context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width:
                MediaQuery.of(context).size.width, // Set width as screen width
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: blueColor,
            ),
          ),
        ),
        ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPostImage(),
              _buildPostDetail(context),
            ],
          ),
        ]),
        Align(alignment: Alignment.bottomCenter, child: _bottomBar(context))
      ]),
    );
  }

  _buildPostImage() {
    return Container(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 48),
        width: double.infinity,
        color: blueColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            widget.post.imageUrl,
            fit: BoxFit.cover,
            height: 224,
          ),
        ));
  }

  _buildPostDetail(context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.post.date} - ${widget.post.userName}',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 21),
          Text(
            widget.post.title,
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.post.caption,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  _bottomBar(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (userContext, userState) {
        if (userState is UserLoaded) {
          print(userState.user);
          return BlocBuilder<RemoteBookmarkBloc, RemoteBookmarkState>(
            builder: (bookmarkContext, bookmarkstate) {
              print(bookmarkstate);
              if (bookmarkstate is RemoteBookmarkChecked) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 30),
                  width: double.infinity,
                  color: whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<RemoteBookmarkBloc>().add(
                                AddRemoteBookmark(
                                    widget.post.id!, userState.user.getId()));
                            context.read<RemoteBookmarkBloc>().add(
                                CheckIsRemoteBookmark(
                                    widget.post.id!, userState.user.getId()));
                            // print(bookmarkstate);
                            // context
                            //     .read<RemoteBookmarkBloc>()
                            //     .add(GetRemoteBookmark(userState.user.getId()));
                          },
                          icon: Image.asset(
                            bookmarkstate.isBookmarked
                                ? "assets/ic_added_bookmark.png"
                                : "assets/ic_add_bookmark.png",
                            width: 30,
                            height: 30,
                          )),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: orangeColor,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              // context
                              //     .read<RemoteCommentBloc>()
                              //     .add(GetRemoteComment(post.id!));
                              Navigator.of(context).pushNamed('/comment',
                                  arguments: widget.post);
                            },
                            child: Text(
                              'Komentar',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      )
                    ],
                  ),
                );
              }
              return Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 30),
                width: double.infinity,
                color: whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<RemoteBookmarkBloc>().add(
                              AddRemoteBookmark(
                                  widget.post.id!, userState.user.getId()));
                          context.read<RemoteBookmarkBloc>().add(
                              CheckIsRemoteBookmark(
                                  widget.post.id!, userState.user.getId()));
                          // print(bookmarkstate);
                          // context
                          //     .read<RemoteBookmarkBloc>()
                          //     .add(GetRemoteBookmark(userState.user.getId()));
                        },
                        icon: Image.asset(
                          "assets/ic_add_bookmark.png",
                          width: 30,
                          height: 30,
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: orangeColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            // context
                            //     .read<RemoteCommentBloc>()
                            //     .add(GetRemoteComment(post.id!));
                            Navigator.of(context)
                                .pushNamed('/comment', arguments: widget.post);
                          },
                          child: Text(
                            'Komentar',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    )
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
