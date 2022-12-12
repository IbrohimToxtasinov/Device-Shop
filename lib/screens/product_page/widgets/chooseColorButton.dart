import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:flutter/material.dart';
class ChooseColorButton extends StatelessWidget {
  final Color colorName;
  final String name;
  const ChooseColorButton({Key? key, required this.colorName, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 104,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.cFFFFFF,
          border: Border.all(width: 1, color: MyColors.cE3E3E3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorName,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: MyTextStyle.ralewayBold.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: MyColors.c000000),
          )
        ],
      ),
    );
  }
}
