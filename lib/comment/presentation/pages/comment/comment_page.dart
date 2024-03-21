import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_raion/comment/domain/entity/comment.dart';
import 'package:internship_raion/comment/presentation/bloc/comment/bloc/remote_comment_bloc.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/shared/shared.dart';

class CommentPage extends StatefulWidget {
  final PostEntity post;
  const CommentPage({super.key, required this.post});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late RemoteCommentBloc _remoteCommentBloc;
  final commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _remoteCommentBloc = BlocProvider.of<RemoteCommentBloc>(context);
    _remoteCommentBloc.add(GetRemoteComment(widget.post.id!));
    print(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      backgroundColor: blueColor,
      title: Text(
        'Komentar',
        style: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      iconTheme: const IconThemeData(color: Colors.white), // Add this line
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteCommentBloc, RemoteCommentState>(
      builder: (_, state) {
        if (state is RemoteCommentLoading) {
          print("testloading");
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoteCommentError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteCommentDone) {
          print(state.comments);
          print("testdone");

          return Scaffold(
              body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: blueColor,
                  ),
                ),
              ),
              ListView(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 30, bottom: 100),
                      child: Column(
                          children: state.comments
                              .map((e) => Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/ic_apple.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.userName!,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      e.content!,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Time',
                                                  style: greyTextStyle.copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  'Reply',
                                                  style: greyTextStyle.copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList())),
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 16),
                    child: Stack(children: [
                      TextFormField(
                        controller: commentController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                          hintText: "Ketik pesan...",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey[200]!, width: 1),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<RemoteCommentBloc>()
                                .add(SendRemoteComment(CommentEntity(
                                  id: "id",
                                  date: "date",
                                  postId: widget.post.id!,
                                  content: commentController.text,
                                  userId: "userId",
                                  userName: "userName baru",
                                  userProfile: "userProfile",
                                )));
                            commentController.clear();
                          },
                          child: Container(
                            child: const Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )),
            ],
          ));
        }
        return Center(
            child: IconButton(
                onPressed: () {
                  context
                      .read<RemoteCommentBloc>()
                      .add(SendRemoteComment(CommentEntity(
                        id: "id",
                        date: "date",
                        postId: widget.post.id!,
                        content: "content",
                        userId: "userId",
                        userName: "userName",
                        userProfile: "userProfile",
                      )));
                },
                icon: Icon(Icons.refresh)));
      },
    );
  }
}
