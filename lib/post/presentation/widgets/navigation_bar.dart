import 'package:flutter/material.dart';
import 'package:internship_raion/shared/shared.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> navbarItems = [
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
            print(ModalRoute.of(context)?.settings.name);

            print(context);
          },
          icon: ModalRoute.of(context)?.settings.name != "/home"
              ? Image.asset(
                  "assets/ic_home.png",
                  width: 40,
                  height: 40,
                )
              : Image.asset(
                  "assets/ic_home_active.png",
                  width: 40,
                  height: 40,
                )),
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/filkom_stuff', (route) => false);
          },
          icon: ModalRoute.of(context)?.settings.name != "/filkom_stuff"
              ? Image.asset(
                  "assets/ic_filkom_stuff.png",
                  width: 40,
                  height: 40,
                )
              : Image.asset(
                  "assets/ic_filkom_stuff_active.png",
                  width: 40,
                  height: 40,
                )),
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/bookmark', (route) => false);
            print(ModalRoute.of(context)?.settings.name);
          },
          icon: ModalRoute.of(context)?.settings.name != "/bookmark"
              ? Image.asset(
                  "assets/ic_bookmark.png",
                  width: 40,
                  height: 40,
                )
              : Image.asset(
                  "assets/ic_bookmark_active.png",
                  width: 40,
                  height: 40,
                )),
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/profile', (route) => false);
          },
          icon: ModalRoute.of(context)?.settings.name != "/profile"
              ? Image.asset(
                  "assets/ic_profile.png",
                  width: 40,
                  height: 40,
                )
              : Image.asset(
                  "assets/ic_profile_active.png",
                  width: 40,
                  height: 40,
                )),
    ];

    return Container(
      height: 64,
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navbarItems.map((e) => e).toList(),
      ),
    );
  }

  // Widget NavBar(context) {
  //   List<Widget> navbarItems = [
  //     IconButton(
  //         onPressed: () {
  //           Navigator.of(context).pushNamedAndRemoveUntil('/');
  // , (route) => false        },
  //         icon: ModalRoute.of(context)?.settings.name != "/"
  //             ? Image.asset(
  //                 "assets/ic_home.png",
  //                 width: 40,
  //                 height: 40,
  //               )
  //             : Image.asset(
  //                 "assets/ic_home_active.png",
  //                 width: 40,
  //                 height: 40,
  //               )),
  //     IconButton(
  //         onPressed: () {},
  //         icon: ModalRoute.of(context)?.settings.name != "/filkom_stuff"
  //             ? Image.asset(
  //                 "assets/ic_filkom_stuff.png",
  //                 width: 40,
  //                 height: 40,
  //               )
  //             : Image.asset(
  //                 "assets/ic_filkom_stuff_active.png",
  //                 width: 40,
  //                 height: 40,
  //               )),
  //     IconButton(
  //         onPressed: () {},
  //         icon: ModalRoute.of(context)?.settings.name != "/bookmark"
  //             ? Image.asset(
  //                 "assets/ic_bookmark.png",
  //                 width: 40,
  //                 height: 40,
  //               )
  //             : Image.asset(
  //                 "assets/ic_bookmark_active.png",
  //                 width: 40,
  //                 height: 40,
  //               )),
  //     IconButton(
  //         onPressed: () {},
  //         icon: ModalRoute.of(context)?.settings.name != "/profile"
  //             ? Image.asset(
  //                 "assets/ic_profile.png",
  //                 width: 40,
  //                 height: 40,
  //               )
  //             : Image.asset(
  //                 "assets/ic_profile_active.png",
  //                 width: 40,
  //                 height: 40,
  //               )),
  //   ];

  //   return Container(
  //     height: 64,
  //     margin: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
  //     decoration: BoxDecoration(
  //       color: blueColor,
  //       borderRadius: BorderRadius.circular(25),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: navbarItems.map((e) => e).toList(),
  //     ),
  //   );
  // }
}
