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
