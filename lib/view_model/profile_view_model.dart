import 'package:device_shop/data/model/user_model.dart';
import 'package:device_shop/data/repositories/profile_repository.dart';
import 'package:device_shop/utils/my_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final ProfileRepository _profileRepository;

  ProfileViewModel(
      {required FirebaseAuth firebaseAuth,
      required ProfileRepository profileRepository})
      : _firebaseAuth = firebaseAuth,
        _profileRepository = profileRepository {
          listenUser();
        }

  User? user;

  Stream<User?> getCurrentUser() => _firebaseAuth.authStateChanges();

  listenUser() {
    _firebaseAuth.authStateChanges().listen((updateUser) {
      user = updateUser;
      notifyListeners();
    });
  }

  addUser(UserModel userModel) {
    _profileRepository.addUser(userModel: userModel);
  }

  setUserName(String userName) async {
    try {
      _firebaseAuth.currentUser!.updateDisplayName(userName);
    } on FirebaseAuthException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  updatePhoto(String photo) => _firebaseAuth.currentUser!.updatePhotoURL(photo);

  updateFCMToken({required String fcmToken, required String docId}) => _profileRepository.updateFCMToken(fcmToken: fcmToken, docId: docId);
}
