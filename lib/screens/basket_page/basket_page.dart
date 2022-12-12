import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/screens/product_page/widgets/button.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:device_shop/view_model/order_view_model.dart';
import 'package:device_shop/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

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
                    onTap: () {}, child: SvgPicture.asset(MyIcons.arrowLeft)),
                Text("Basket",
                    style: MyTextStyle.ralewayBold.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: MyColors.c000000)),
                InkWell(onTap: () {}, child: SvgPicture.asset(MyIcons.delete)),
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
                  SvgPicture.asset(MyIcons.notification),
                  const SizedBox(
                    width: 6.5,
                  ),
                  Text(
                    "Delivery for FREE until the end of the month",
                    style: MyTextStyle.sfProSemibold.copyWith(
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
              child: Consumer<OrderViewModel>(
                  builder: ((context, orderViewModel, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: orderViewModel.orders.length,
                  itemBuilder: (context, int index) {
                    ProductModel products = orderViewModel.listenOrdersProducts(orderViewModel.orders[index].productId);
                    return Container(
                      height: 50,
                      width: 300,
                      color: Colors.red,
                      child: Text(products.productName),
                    );
                  },
                );
              }))),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 53),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: MyTextStyle.ralewayRegular.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: MyColors.c000000)),
                Text("\$ 400",
                    style: MyTextStyle.ralewayBold.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: MyColors.c5956E9)),
              ],
            ),
          ),
          const SizedBox(height: 51),
          Padding(
              padding: const EdgeInsets.only(right: 50, bottom: 41, left: 50),
              child: ButtonWidget(name: "Checkout", onTap: () {})),
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
                style: MyTextStyle.ralewaySemiBold.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.c000000)),
            const SizedBox(height: 12),
            Text("\$$price",
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
                            style: MyTextStyle.ralewaySemiBold.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: MyColors.cFFFFFF))),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  "$count",
                  style: MyTextStyle.ralewaySemiBold.copyWith(
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

// import 'package:device_shop/data/model/order_model.dart';
// import 'package:device_shop/view_model/order_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class AllOrderScreen extends StatefulWidget {
//   const AllOrderScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AllOrderScreen> createState() => _AllOrderScreenState();
// }

// class _AllOrderScreenState extends State<AllOrderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Orders")),
//       body: Consumer<OrderViewModel>(
//         builder: ((context, orderViewModel, child) {
//           return ListView(
//             children: List.generate(orderViewModel.orders.length, (index) {
//               OrderModel orders = orderViewModel.orders[index];
//               return ListTile(
//                 title: Text(orders.productId),
//                 trailing: Text(orders.count.toString()),
//               );
//             }),
//           );
//         }),
//       ),
//     );
//   }
// }
