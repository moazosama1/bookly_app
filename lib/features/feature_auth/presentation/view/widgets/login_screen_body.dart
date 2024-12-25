import 'package:bookly_app/core/function/regex.dart';
import 'package:bookly_app/core/theme/color.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/feature_auth/data/repo/auth_repo_impl.dart';
import 'package:bookly_app/features/feature_auth/presentation/veiw_model/auth_cubit.dart';
import 'package:bookly_app/features/feature_auth/presentation/view/widgets/textField/custom_textField_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/custom_button.dart';
import 'custom_appBar/custom_appBar.dart';
import 'textField/custom_textFromField.dart';
import 'custom_text_button.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var cubit = BlocProvider.of<AuthCubit>(context);
    var theme = Theme.of(context);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginSuccess) {
                var show = toastification.show(
                  context: context,
                  foregroundColor: Colors.white,
                  showProgressBar: false,
                  title: Text(
                    "Success",
                    style: Style.textStyle18,
                  ),
                  autoCloseDuration: const Duration(seconds: 5),
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.lightGreen,
                  borderSide: BorderSide.none,
                );
                GoRouter.of(context).push(AppRouter.kHomeView);
              } else if (state is AuthLoginFailure) {
                toastification.show(
                  context: context,
                  foregroundColor: Colors.white,
                  showProgressBar: false,
                  title: Text(
                    state.errorMessage,
                    style: Style.textStyle18,
                  ),
                  autoCloseDuration: const Duration(seconds: 5),
                  icon: Icon(
                    Icons.error_outline_rounded,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                  borderSide: BorderSide.none,
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAppBarInAuth(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome\nBack",
                    style: TextStyle(
                      fontSize: 40,
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightMediaQuery * 0.1,
                  ),
                  CustomTextFromField(
                    title: "Email",
                    validator: Regex.validateEmail,
                    iconData: Icon(Icons.alternate_email),
                    onChange: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFromFieldPassword(
                    title: "Password",
                    validator: Regex.validatePassword,
                    iconData: Icon(Icons.visibility),
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kResetPasswordView);
                      },
                      child: Text(
                        "Forget password?",
                        style: Style.textStyle18
                            .copyWith(fontWeight: FontWeight.w700 , fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: heightMediaQuery * 0.1),
                  CustomTextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kRegisterView);
                    },
                    text: "Create new account?",
                    textButton: "Sign Up",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    isLoading: cubit.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.loginAccount(email: email!, password: password!);
                      }
                    },
                    colorLoading: theme.colorScheme.onPrimary,
                    textButton: "Login",
                    colorText: theme.colorScheme.onPrimary,
                    colorButton: ColorOfApp.blueColor,
                    fontSize: 25,
                    borderButton: BorderRadius.circular(15),
                  ),
                  SizedBox(height: heightMediaQuery * 0.15),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
