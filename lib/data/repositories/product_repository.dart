import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_shop/data/model/product_model.dart';
import 'package:device_shop/utils/my_utils.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addProducts({required ProductModel productModel}) async {
    try {
      var newProduct =
          await _firestore.collection("products").add(productModel.toJson());
      await _firestore.collection("products").doc(newProduct.id).update({
        "product_id": newProduct.id,
      });
      MyUtils.getMyToast(message: "Mahsulot muvaffaqiyatli qo'shiladi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteProducts({required String doId}) async {
    try {
      await _firestore.collection("products").doc(doId).delete();
      MyUtils.getMyToast(message: "Mahsulot muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateProducts({required ProductModel productModel}) async {
    try {
      await _firestore
          .collection("products")
          .doc(productModel.productId)
          .update(productModel.toJson());

      MyUtils.getMyToast(message: "Mahsulot muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<ProductModel>> getProducts() =>
      _firestore.collection("products").snapshots().map(
            (event1) => event1.docs
                .map((doc) => ProductModel.fromJson(doc.data()))
                .toList(),
          );
}
