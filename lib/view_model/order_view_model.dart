import 'dart:async';
import 'package:device_shop/data/model/order_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/data/repositories/order_repository.dart';
import 'package:flutter/cupertino.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderRepository orderRepository;

  OrderViewModel({required this.orderRepository}) {
    listenOrders();
    listenOrdersProducts("");
  }

  late StreamSubscription subscription;

  List<OrderModel> orders = [];
  List<ProductModel> ordersproduct = [];

  listenOrdersProducts(dynamic productId) async {
    subscription = orderRepository.getOrderProduct(productId: productId).listen((allOrders) {
      ordersproduct = allOrders;
      notifyListeners();
    })
      ..onError((er) {});
  }

  listenOrders() async {
    subscription = orderRepository.getOrders().listen((allOrders) {
      orders = allOrders;
      notifyListeners();
    })
      ..onError((er) {});
  }

  addOrder(OrderModel orderModel) =>
      orderRepository.addOrder(orderModel: orderModel);
  updateOrder(OrderModel orderModel) =>
      orderRepository.updateOrder(orderModel: orderModel);
  deleteOrder(String docId) =>
      orderRepository.deleteOrder(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}