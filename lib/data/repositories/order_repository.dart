import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_shop/data/model/order_model.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/utils/my_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addOrder({required OrderModel orderModel}) async {
    try {
      var newProduct =
          await _firestore.collection("orders").add(orderModel.toJson());
      await _firestore.collection("orders").doc(newProduct.id).update({
        "order_id": newProduct.id,
        "user_id": FirebaseAuth.instance.currentUser?.uid.toString(),
      });
      MyUtils.getMyToast(
          message: "Mahsulot muvaffaqiyatli savatga qo'shiladi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteOrder({required String docId}) async {
    try {
      await _firestore.collection("orders").doc(docId).delete();
      MyUtils.getMyToast(
          message: "Mahsulot muvaffaqiyatli savatdan o'chirildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateOrder({required OrderModel orderModel}) async {
    try {
      await _firestore
          .collection("orders")
          .doc(orderModel.orderId)
          .update(orderModel.toJson());

      MyUtils.getMyToast(
          message: "Mahsulot muvaffaqiyatli savatdan yangilandi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<OrderModel>> getOrders() =>
      _firestore.collection("orders").snapshots().map(
            (event1) => event1.docs
                .map((doc) => OrderModel.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<ProductModel>> getOrderProduct({required dynamic productId}) =>
      _firestore
          .collection("products")
          .where("product_id", isEqualTo: productId)
          .snapshots()
          .map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => ProductModel.fromJson(doc.data()))
                .toList(),
          );
}
