import 'package:device_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String imageName;
  final String hintName;
  final TextEditingController controller;
  const MyTextFormField({
    super.key,
    required this.imageName,
    required this.hintName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(imageName),
            const SizedBox(width: 13),
            Text(
              hintName,
              style: GoogleFonts.raleway(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: MyColors.c868686),
            )
          ],
        ),
        TextFormField(
          style: const TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          obscureText: false,
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter your $hintName",
            hintStyle: const TextStyle(color: MyColors.c868686),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: MyColors.c868686),
            ),
          ),
        ),
      ],
    );
  }
}
