import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_raion/shared/shared.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: Text(
                "Info Filkom",
                style: whiteTextStyle.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
        ),
        Container(
          height: 30,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: Text(
                "Info Filkom",
                style: whiteTextStyle.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
        ),
        Container(
          height: 30,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: Text(
                "Info Filkom",
                style: whiteTextStyle.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
        ),
        Container(
          height: 30,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: Text(
                "Info Filkom",
                style: whiteTextStyle.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }
}
