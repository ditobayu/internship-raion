import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_raion/blocs/user/user_bloc.dart';
import 'package:internship_raion/comment/presentation/bloc/comment/bloc/remote_comment_bloc.dart';
import 'package:internship_raion/models/models.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/presentation/bloc/bookmark/remote/remote_bookmark_bloc.dart';
import 'package:internship_raion/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_raion/post/presentation/widgets/navigation_bar.dart';
import 'package:internship_raion/shared/shared.dart';

class BookmarkPage extends StatefulWidget {
  // final String userId;
  // const BookmarkPage({super.key, required this.userId});

  const BookmarkPage({Key? key}) : super(key: key);
  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late RemoteBookmarkBloc _remoteBookmarkBloc;
  late UserBloc _userBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state');

    _remoteBookmarkBloc = BlocProvider.of<RemoteBookmarkBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    // _remoteBookmarkBloc.add(GetRemoteBookmark(widget.userId));
    if (_userBloc.state is UserLoaded) {
      _remoteBookmarkBloc
          .add(GetRemoteBookmark((_userBloc.state as UserLoaded).user.getId()));
    }
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
      title: Text(
        'Simpan',
        style: TextStyle(color: blueColor),
      ),
    );
  }

  _buildBody(context) {
    return BlocBuilder<RemoteBookmarkBloc, RemoteBookmarkState>(
        builder: (context, state) {
      print(state);
      if (state is RemoteBookmarkLoading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is RemoteBookmarkError) {
        return const Center(child: Icon(Icons.refresh));
      } else if (state is RemoteBookmarkDone) {
        return Stack(
          children: [
            GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              crossAxisCount: 2,
              children: state.posts
                  .map((e) => GestureDetector(
                        // onTap: _onPostItemPressed(context, e),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/post-detail', arguments: e);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(
                                    20,
                                  ),
                                ),
                                child: Image.network(
                                  e.imageUrl,
                                  width: double.infinity,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  "asdasd",
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: medium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const Align(alignment: Alignment.bottomCenter, child: NavBar())
          ],
        );
      }
      return const SizedBox();
    });
  }

  // _onPostItemPressed(BuildContext context, PostEntity post) {
  //   Navigator.of(context).pushNamed('/post-detail', arguments: post);
  // }
}
