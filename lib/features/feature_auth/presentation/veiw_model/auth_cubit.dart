import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/feature_auth/data/model/user.dart';
import 'package:bookly_app/features/feature_auth/data/repo/auth_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  AuthRepoImpl authRepo;
  UserModel? userModel;
  bool isLoading = false;
  void createNewAccount({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    emit(AuthRegisterLoading());
    onPressed(true, AuthRegisterLoading());
    var result = await authRepo.createNewEmail(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    result.fold(
      (success) {
        emit(AuthRegisterSuccess());
        onPressed(false, AuthInitial());
      },
      (error) {
        onPressed(false, AuthInitial());
        emit(AuthRegisterFailure(errorMessage: error.errorMessage));
      },
    );
  }

  loginAccount({required String email, required String password}) async {
    emit(AuthLoginLoading());
    onPressed(true, AuthLoginLoading());
    var result = await authRepo.loginAccount(email: email, password: password);
    result.fold(
      (success) {
        emit(AuthLoginSuccess());
        onPressed(false, AuthInitial());
      },
      (error) {
        onPressed(false, AuthInitial());
        emit(AuthLoginFailure(errorMessage: error.errorMessage));
      },
    );
  }

  void logoutAccount() async {
    authRepo.logoutAccount();
  }

  Future<UserModel?> getUserInfo() async {
    userModel = UserModel();
    userModel = await authRepo.getUserInfo();
    UserModel? user = await authRepo.getUserInfo();
    return user;
  }

  void onPressed(bool loading, state) {
    isLoading = loading;
    if (loading) {
      emit(state);
    } else {
      emit(AuthInitial());
    }
  }

  resetPassword({required String email}) async {
    emit(AuthResetLoading());
    onPressed(true, AuthResetLoading());
    var result = await authRepo.sendResetPasswordToEmail(email: email);
    result.fold(
      (success) {
        emit(AuthResetSuccess());
        onPressed(false, AuthResetSuccess());
      },
      (error) {
        onPressed(false, AuthResetLoading());
        emit(AuthResetFailure(errorMessage: error.errorMessage));
      },
    );
  }
}
