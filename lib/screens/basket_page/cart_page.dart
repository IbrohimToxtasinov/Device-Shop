import 'package:device_shop/data/model/order_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/main.dart';
import 'package:device_shop/screens/basket_page/widgets/cart_item_widgets.dart';
import 'package:device_shop/screens/product_page/widgets/button.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:device_shop/view_model/order_view_model.dart';
import 'package:device_shop/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

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
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const MainPage()));
                    },
                    child: SvgPicture.asset(MyIcons.arrowLeft)),
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
                var totalPrice = orderViewModel.orders.isNotEmpty
                    ? orderViewModel.orders.map((e) => (e.totalPrice)).reduce(
                          (value, element) => value + element,
                        )
                    : 0;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: orderViewModel.orders.length,
                        itemBuilder: (context, int index) {
                          var all = Provider.of<ProductViewModel>(context)
                              .allProducts;
                          ProductModel product = all.firstWhere((element) =>
                              element.productId ==
                              orderViewModel.orders[index].productId);
                          return CartItemWidget(
                            count: orderViewModel.orders[index].count,
                            onAdd: () {
                              List<OrderModel> orders =
                                  Provider.of<OrderViewModel>(context,
                                          listen: false)
                                      .orders;

                              List<OrderModel> exists = orders
                                  .where((e) =>
                                      e.productId ==
                                      orderViewModel.orders[index].productId)
                                  .toList();

                              if (exists.isNotEmpty) {
                                orders.forEach((element) {
                                  if (element.productId ==
                                      orderViewModel.orders[index].productId) {
                                    Provider.of<OrderViewModel>(context,
                                            listen: false)
                                        .updateOrderIfExists(
                                            productId: element.productId,
                                            count: 1);
                                  }
                                });
                              }
                            },
                            onMinus: () {
                              List<OrderModel> orders =
                                  Provider.of<OrderViewModel>(context,
                                          listen: false)
                                      .orders;
                              List<OrderModel> exists = orders
                                  .where((e) =>
                                      e.productId ==
                                      orderViewModel.orders[index].productId)
                                  .toList();

                              if (exists.isNotEmpty) {
                                orders.forEach((element) {
                                  if (element.productId ==
                                      orderViewModel.orders[index].productId) {
                                    if (orderViewModel.orders[index].count !=
                                        1) {
                                      Provider.of<OrderViewModel>(context,
                                              listen: false)
                                          .updateOrderIfExists(
                                              productId: element.productId,
                                              count: -1);
                                    } else {
                                      Provider.of<OrderViewModel>(context,
                                              listen: false)
                                          .deleteOrder(orderViewModel
                                              .orders[index].orderId);
                                    }
                                  }
                                });
                              }
                            },
                            imageName: product.productImages,
                            productName: product.productName,
                            productPrice: product.price,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 50, left: 53, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: MyTextStyle.ralewayRegular.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.c000000)),
                          Text(
                            "\$ $totalPrice ",
                            style: MyTextStyle.ralewayBold.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: MyColors.c5956E9),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }))),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 50, bottom: 15, left: 50),
            child: ButtonWidget(name: "Checkout", onTap: () {}),
          ),
        ],
      ),
    );
  }
}
