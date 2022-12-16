import 'package:device_shop/data/model/user_model.dart';
import 'package:device_shop/data/repositories/profile_repository.dart';
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

 Future<UserModel?> fetchUser() async {
  var  userModel = await _profileRepository.getSingleUser(
        firebaseUid: FirebaseAuth.instance.currentUser!.uid);
  return userModel;
  }

  Stream<User?> getCurrentUser() => _firebaseAuth.authStateChanges();

  listenUser() {
    _firebaseAuth.authStateChanges().listen((updatedUser) {
      user = updatedUser;
      notifyListeners();
    });
  }

  addUser(UserModel userModel) =>
      _profileRepository.addUser(userModel: userModel);

  setUserName(String userName) async {
    try {
      _firebaseAuth.currentUser!.updateDisplayName(userName);
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
    }
  }

  updatePhoto(String photo) => _firebaseAuth.currentUser!.updatePhotoURL(photo);

  updateFCMToken({ required String fcmToken, required String userId}) =>
      _profileRepository.updateUserFCMToken(fcmToken: fcmToken, userId: userId);
}