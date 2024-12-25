import 'package:bookly_app/core/errors/firebase_error.dart';
import 'package:bookly_app/features/feature_auth/data/repo/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/function/get_locale_data.dart';
import '../../presentation/veiw_model/auth_cubit.dart';
import '../model/user.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<void, ErrorFirebase>> createNewEmail(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentReference docRef = await users.add(
        UserModel(phone: phone, name: name, email: email, favorite: [])
            .toJson(),
      );
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(email, docRef.id);
      return left(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return right(ErrorFirebase.fromFirebase(e));
      } else {
        return right(ErrorFirebase(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<void, ErrorFirebase>> loginAccount(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("email", email);
      return left(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return right(ErrorFirebase.fromFirebase(e));
      } else {
        return right(ErrorFirebase(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<UserModel?> getUserInfo() async {
    try {
      String? email = await getEmailFromLocaleData();
      CollectionReference user = FirebaseFirestore.instance.collection("users");
      QuerySnapshot querySnapshot =
          await user.where("email", isEqualTo: email).get();
      UserModel? userModel;
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        userModel = UserModel.fromJson(documentSnapshot.data());
      }
      return userModel;
    } on Exception catch (e) {
      return UserModel();
    }
  }

  void logoutAccount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? emailId = await getEmailFromLocaleData();
    sharedPreferences.remove("email");
    await FirebaseAuth.instance.signOut();
  }

  Future<Either<void, ErrorFirebase>> sendResetPasswordToEmail(
      {required String email}) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final userCredential =
          await firebaseAuth.sendPasswordResetEmail(email: email);
      return left(null);
    } catch (e) {
      return right(ErrorFirebase(errorMessage: "Invalid Email"));
    }
  }
}
