import 'dart:async';
import 'package:device_shop/data/model/order_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/data/repositories/order_repository.dart';
import 'package:flutter/cupertino.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderRepository orderRepository;

  OrderViewModel({required this.orderRepository}) {
    listenOrders();
  }

  late StreamSubscription subscription;

  List<OrderModel> orders = [];
  ProductModel? productModel;

  getOrdersProducts(dynamic productId) async {
    productModel = await orderRepository.getProductById(productId: productId);
    notifyListeners();
  }

  listenOrders() async {
    subscription = orderRepository.getOrders().listen((allOrders) {
      orders = allOrders;
      notifyListeners();
    })
      ..onError((er) {});
  }

  updateOrderIfExists({
    required String productId,
    required int count,
  }) {
    OrderModel orderModel =
        orders.firstWhere((element) => element.productId == productId);

    int currentCount = orderModel.count;

    int price = orderModel.totalPrice ~/ orderModel.count;

    orderRepository.updateOrder(
      orderModel: orderModel.copWith(
        count: currentCount + count,
        totalPrice: price * (currentCount + count),
      ),
    );
  }

  addOrder(OrderModel orderModel) =>
      orderRepository.addOrder(orderModel: orderModel);
  updateOrder(OrderModel orderModel) =>
      orderRepository.updateOrder(orderModel: orderModel);
  deleteOrder(String docId) => orderRepository.deleteOrder(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
