import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_raion/post/domain/entity/post.dart';
import 'package:internship_raion/post/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:internship_raion/post/presentation/widgets/navigation_bar.dart';
import 'package:internship_raion/shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoriesIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemotePostBloc, RemotePostState>(
      builder: (_, state) {
        if (state is RemotePostLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemotePostError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemotePostLoaded) {
          return Scaffold(
            body: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Set width as screen width
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: blueColor,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width, //
                  height: 272,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(50), // Add this line
                  ),
                ),
              ),
              ListView(
                children: [
                  _buildHeader(),
                  _buildSearch(),
                  _buildCategories(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: state.posts
                          .where((post) => _selectedCategoriesIndex == 0
                              ? post.category == "filkom"
                              : _selectedCategoriesIndex == 1
                                  ? post.category == "lomba"
                                  : _selectedCategoriesIndex == 2
                                      ? post.category == "lo/lof"
                                      : _selectedCategoriesIndex == 3
                                          ? post.category == "beasiswa & magang"
                                          : false)
                          .map(
                            (post) => GestureDetector(
                              onTap: () {
                                _onPostItemPressed(_, post);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: Image.network(
                                      post.imageUrl,
                                      width: double.infinity,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 34),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              const Align(alignment: Alignment.bottomCenter, child: NavBar())
            ]),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
      // ),
      child: Row(
        children: [
          Text(
            "Beranda",
            style: whiteTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/create-post');
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.notifications,
            color: whiteColor,
          )
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      // color: blueColor,
      child: TextFormField(
        style: TextStyle(color: whiteColor), // Set text color to white

        decoration: InputDecoration(
          hintText: "Cari",
          hintStyle: whiteTextStyle.copyWith(
              fontSize: 15, fontWeight: FontWeight.w600),
          prefixIcon: Icon(
            Icons.search,
            color: whiteColor,
          ),
          fillColor: whiteColor.withOpacity(0.58),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      // color: blueColor,
      padding: const EdgeInsets.only(left: 20, top: 12, bottom: 18, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30,
            child: TextButton(
                style: _selectedCategoriesIndex == 0
                    ? TextButton.styleFrom(
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )
                    : null,
                onPressed: () {
                  setState(() {
                    _selectedCategoriesIndex = 0;
                  });
                },
                child: Text(
                  "Info Filkom",
                  style: whiteTextStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.w500),
                )),
          ),
          Container(
            height: 30,
            child: TextButton(
                style: _selectedCategoriesIndex == 1
                    ? TextButton.styleFrom(
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )
                    : null,
                onPressed: () {
                  setState(() {
                    _selectedCategoriesIndex = 1;
                  });
                },
                child: Text(
                  "Info Lomba",
                  style: whiteTextStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.w500),
                )),
          ),
          Container(
            height: 30,
            child: TextButton(
                style: _selectedCategoriesIndex == 2
                    ? TextButton.styleFrom(
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )
                    : null,
                onPressed: () {
                  setState(() {
                    _selectedCategoriesIndex = 2;
                  });
                },
                child: Text(
                  "Info LO/LOF",
                  style: whiteTextStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.w500),
                )),
          ),
          Container(
            height: 30,
            child: TextButton(
                style: _selectedCategoriesIndex == 3
                    ? TextButton.styleFrom(
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )
                    : null,
                onPressed: () {
                  setState(() {
                    _selectedCategoriesIndex = 3;
                  });
                },
                child: Text(
                  "Info Beasiswa & Magang",
                  style: whiteTextStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }

  _onPostItemPressed(BuildContext context, PostEntity post) {
    Navigator.of(context).pushNamed('/post-detail', arguments: post);
  }
}
