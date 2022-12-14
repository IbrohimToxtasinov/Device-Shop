import 'package:device_shop/utils/styles.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final String name;
  final Color textColor;
  const MyButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.name,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: 
        onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            name,
            style: MyTextStyle.ralewayBold.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
      ),
    );
  }
}
