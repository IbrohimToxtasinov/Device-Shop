import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const ButtonWidget({Key? key, required this.name, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.c5956E9,
        ),
        child: Center(
          child: Text(
            name,
            style: MyTextStyle.ralewayBold.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700, color: MyColors.cFFFFFF),
          ),
        ),
      ),
    );
  }
}
