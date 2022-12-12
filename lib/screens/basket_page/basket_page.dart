import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_ecommerce_app/data/my_cart.dart';
import 'package:tech_ecommerce_app/models/purchase.dart';
import 'package:tech_ecommerce_app/utils/colors.dart';
import 'package:tech_ecommerce_app/utils/images.dart';
import 'package:tech_ecommerce_app/widgets/build_button_widget.dart';

class CartPage extends StatefulWidget {
  final Purchase myData = Purchase(myCart);
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

num sum = 0;

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cE5E5E5,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 76, right: 35, left: 35, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(MyImages.iconArrowrLeft)),
                Text("Basket",
                    style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: MyColors.c000000)),
                InkWell(
                    onTap: () {}, child: SvgPicture.asset(MyImages.iconDelete)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 65, left: 70),
            child: Container(
              height: 39,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.cD3F2FF,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(MyImages.iconNotification),
                  const SizedBox(
                    width: 6.5,
                  ),
                  Text(
                    "Delivery for FREE until the end of the month",
                    style: GoogleFonts.raleway(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: MyColors.c000000),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.535,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: myCart.length,
              itemBuilder: (context, int index) {
                return buildCart(context,
                    count: myCart.elementAt(index).count,
                    name: myCart.elementAt(index).name,
                    imageName: myCart.elementAt(index).imageName,
                    price: myCart.elementAt(index).price, onAdd: () {
                  setState(() {
                    myCart.elementAt(index).count++;
                  });
                }, onMinus: () {
                  setState(() {
                    if (myCart.elementAt(index).count - 1 <= 0) {
                      myCart.elementAt(index).count = 0;
                      myCart.remove(myCart.elementAt(index));
                    } else {
                      myCart.elementAt(index).count--;
                    }
                  });
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 53),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: MyColors.c000000)),
                Text("\$ ${widget.myData.getcost()}",
                    style: GoogleFonts.raleway(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: MyColors.c5956E9)),
              ],
            ),
          ),
          const SizedBox(height: 51),
          Padding(
            padding: const EdgeInsets.only(right: 50, bottom: 41, left: 50),
            child: button(context, name: "Checkout", onTap: () {
              
            },)
          ),
        ],
      ),
    );
  }
}

Widget buildCart(BuildContext context,
    {required VoidCallback onAdd,
    required VoidCallback onMinus,
    name,
    count,
    imageName,
    price}) {
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
          child: Image.asset(imageName),
        ),
        const SizedBox(width: 9),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.c000000)),
            const SizedBox(height: 12),
            Text("\$$price",
                style: GoogleFonts.raleway(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: MyColors.c5956E9)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quantity",
                    style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: MyColors.c000000)),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    onMinus();
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
                            style: GoogleFonts.raleway(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: MyColors.cFFFFFF))),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  "$count",
                  style: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: MyColors.c000000),
                ),
                const SizedBox(width: 7),
                InkWell(
                  onTap: () {
                    onAdd();
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
                            style: GoogleFonts.raleway(
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
