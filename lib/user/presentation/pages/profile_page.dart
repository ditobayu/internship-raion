import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internship_raion/post/presentation/widgets/navigation_bar.dart';
import 'package:internship_raion/services/services.dart';
import 'package:internship_raion/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/home');
      //   },
      //   icon: const Icon(
      //     Icons.arrow_back,
      //     color: Colors.white,
      //   ),
      // ),
      backgroundColor: blueColor,
      title: Text(
        'Profil',
        style: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      iconTheme: const IconThemeData(color: Colors.white), // Add this line
    );
  }

  _buildBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: blueColor,
            ),
          ),
        ),
        ListView(
          children: [
            const SizedBox(height: 100),
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
                  left: 20, right: 20, top: 30, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await AuthServices.signOut(context);
                    },
                    child: const Text("Sign Out"),
                  ),
                  // _buildPostForm(context),
                ],
              ),
            ),
          ],
        ),
        const Align(alignment: Alignment.bottomCenter, child: NavBar())
      ],
    );
  }
}
