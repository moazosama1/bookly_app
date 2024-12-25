import 'package:bookly_app/features/feature_auth/data/model/user.dart';

abstract class AuthRepo {
  Future<void> createNewEmail(
      {required String email,
      required String password,
      required String phone,
      required String name});
  void loginAccount({required String email , required String password});
  Future<UserModel?> getUserInfo();
}
