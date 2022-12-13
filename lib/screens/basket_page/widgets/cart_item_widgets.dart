import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget(
      {super.key,
      required this.imageName,
      required this.productName,
      required this.productPrice,
      required this.onMinus,
      required this.onAdd,
      required this.count});

  final List<dynamic> imageName;
  final String productName;
  final num productPrice;
  final VoidCallback onMinus;
  final VoidCallback onAdd;
  final int count;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15, bottom: 11, top: 14, right: 17),
      margin: const EdgeInsets.only(left: 15, bottom: 11, right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.cFFFFFF,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 105,
            width: 105,
            child: Image.network(widget.imageName[0]),
          ),
          const SizedBox(width: 9),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.productName,
                  style: MyTextStyle.ralewaySemiBold.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MyColors.c000000)),
              const SizedBox(height: 12),
              Text("\$ ${widget.productPrice}",
                  style: MyTextStyle.ralewaySemiBold.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: MyColors.c5956E9)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quantity",
                      style: MyTextStyle.ralewayLight.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: MyColors.c000000)),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      widget.onMinus();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: MyColors.c7DCCEC,
                      ),
                      child: Center(
                          child: Text("-",
                              style: MyTextStyle.ralewaySemiBold.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.cFFFFFF))),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "${widget.count}",
                    style: MyTextStyle.ralewaySemiBold.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: MyColors.c000000),
                  ),
                  const SizedBox(width: 7),
                  InkWell(
                    onTap: () {
                      widget.onAdd();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: MyColors.c7DCCEC,
                      ),
                      child: Center(
                          child: Text("+",
                              style: MyTextStyle.ralewaySemiBold.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.cFFFFFF))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
