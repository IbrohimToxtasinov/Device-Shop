import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextFormFieldPassword extends StatefulWidget {
  final String imageName;
  final String hintName;
  final bool isVisiblity;
  final VoidCallback onTap;
  final String suffixText;
  final TextEditingController controller;
  const MyTextFormFieldPassword({
    super.key,
    required this.imageName,
    required this.hintName,
    required this.isVisiblity,
    required this.onTap,
    required this.suffixText,
    required this.controller,
  });

  @override
  State<MyTextFormFieldPassword> createState() =>
      _MyTextFormFieldPasswordState();
}

class _MyTextFormFieldPasswordState extends State<MyTextFormFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(widget.imageName),
            const SizedBox(width: 13),
            Text(
              widget.hintName,
              style: MyTextStyle.ralewaySemiBold.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: MyColors.c868686),
            )
          ],
        ),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          obscureText: widget.isVisiblity,
          decoration: InputDecoration(
            hintText: "Enter your ${widget.hintName}",
            suffix: TextButton(
                onPressed: widget.onTap,
                child: Text(
                  widget.suffixText,
                  style: MyTextStyle.ralewaySemiBold.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: MyColors.c5956E9),
                )),
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
