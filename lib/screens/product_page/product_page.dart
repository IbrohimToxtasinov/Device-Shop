import 'package:device_shop/data/model/order_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/screens/product_page/widgets/button.dart';
import 'package:device_shop/screens/product_page/widgets/chooseColorButton.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:device_shop/view_model/order_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel getData;

  const ProductScreen({super.key, required this.getData});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cE5E5E5,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 33, right: 52, top: 71),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(MyIcons.arrowLeft),
                SvgPicture.asset(MyIcons.heart),
              ],
            ),
          ),
          Image.network(
            widget.getData.productImages[0],
            width: double.infinity,
            height: 243,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: MyColors.cFFFFFF,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 29, left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.getData.productName,
                      style: MyTextStyle.ralewaySemiBold.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: MyColors.c000000),
                    ),
                    const SizedBox(height: 20),
                    Text("Colors",
                        style: MyTextStyle.ralewayBold.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 39),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ChooseColorButton(
                              name: "Sky Blue", colorName: MyColors.c7485C1),
                          ChooseColorButton(
                              name: "Rose Gold", colorName: MyColors.cC9A19C),
                          ChooseColorButton(
                              name: "Green", colorName: MyColors.cA1C89B),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    Text(
                      "Get Apple TV+ free for a year",
                      style: MyTextStyle.ralewayBold.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: MyColors.c000000),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      padding: const EdgeInsets.only(right: 30),
                      width: double.infinity,
                      child: Text(
                        "Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial.",
                        style: MyTextStyle.ralewayRegular.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: MyColors.c000000.withOpacity(0.6),
                            height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Full description",
                            style: MyTextStyle.ralewayBold.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: MyColors.c5956E9)),
                        const SizedBox(
                          width: 7,
                        ),
                        SvgPicture.asset(MyIcons.arrowRight),
                        const Spacer(),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 33, left: 13, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: MyTextStyle.ralewayMedium.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.c000000)),
                          Text("\$ ${widget.getData.price.toString()}",
                              style: MyTextStyle.ralewayBold.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.c5956E9))
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 50, left: 10, bottom: 30),
                      child: ButtonWidget(
                        name: "Add to basket",
                        onTap: () {
                          List<OrderModel> orders = Provider.of<OrderViewModel>(
                                  context,
                                  listen: false)
                              .orders;

                          List<OrderModel> exists = orders
                              .where((e) =>
                                  e.productId == widget.getData.productId)
                              .toList();

                          if (exists.isNotEmpty) {
                            orders.forEach((element) {
                              if (element.productId ==
                                  widget.getData.productId) {
                                Provider.of<OrderViewModel>(context,
                                        listen: false)
                                    .updateOrderIfExists(
                                        productId: element.productId, count: 1);
                              }
                            });
                          } else {
                            Provider.of<OrderViewModel>(context, listen: false)
                                .addOrder(
                              OrderModel(
                                count: 1,
                                totalPrice: widget.getData.price * 1,
                                orderId: "",
                                productId: widget.getData.productId,
                                userId: FirebaseAuth.instance.currentUser!.uid,
                                orderStatus: "ordered",
                                createdAt: DateTime.now().toString(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
