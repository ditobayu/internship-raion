import 'package:flutter/material.dart';
import 'package:internship_raion/shared/shared.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const CustomFilledButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.width = double.infinity,
    this.height = 46,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}

class CustomFilledButtonOtherServices extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onPressed;

  const CustomFilledButtonOtherServices({
    super.key,
    required this.title,
    this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      height: 46,
      width: 100,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: greyColor, width: 1),
                borderRadius: BorderRadius.circular(5))),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
      ),
    );
  }
}
