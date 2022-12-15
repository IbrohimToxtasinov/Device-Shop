import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_shop/data/model/user_model.dart';
import 'package:device_shop/utils/my_utils.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore;

  ProfileRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addUser({required UserModel userModel}) async {
    try {
      var newUser =
          await _firestore.collection("users").add(userModel.toJson());
      await _firestore.collection("users").doc(newUser.id).update({
        "user_id": newUser.id,
      });
      MyUtils.getMyToast(message: "User muvaffaqiyatli qo'shildi");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Future<void> updateFCMToken(
      {required String fcmToken, required String docId}) async {
    try {
      await _firestore.collection("users").doc(docId).update({
        "fcm_token": fcmToken,
      });
      MyUtils.getMyToast(message: "Token olindi");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }
}
