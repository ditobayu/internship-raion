import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_raion/shared/shared.dart';

class CustomPostTextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomPostTextInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: blackTextStylePoppins.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      Container(
        // padding: const EdgeInsets.symmetric(vertical: 5),
        height: 45,
        // color: blueColor,
        child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300), // Set text color to white

          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: blackTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w300),
            fillColor: greyInputColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    ]);
  }
}

class CustomPostTextArea extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomPostTextArea(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      maxLines: 4,
      style: blackTextStyle.copyWith(
          fontSize: 14, fontWeight: FontWeight.w300), // Set text color to white

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            blackTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w300),
        fillColor: greyInputColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}

class CustomPostInputImage extends StatelessWidget {
  final String label;
  final String hintText;
  final DateTime? selectedDate;
  final Function() onPressed;

  const CustomPostInputImage(
      {super.key,
      required this.label,
      required this.hintText,
      this.selectedDate,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    print(selectedDate);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: blackTextStylePoppins.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      Container(
        // padding: const EdgeInsets.symmetric(vertical: 5),
        height: 45,
        width: MediaQuery.of(context).size.width,

        // color: blueColor,
        child: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: greyInputColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: onPressed,
          child: selectedDate == null
              ? Text(
                  "Masukkan tanggal",
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w300),
                )
              : Text(
                  "${DateFormat('dd MMMM yyyy').format(selectedDate!.toLocal())}",
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
        ),
      ),
    ]);
  }
}
