import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/custom_button.dart';
import 'package:bookly_app/features/feature_auth/presentation/veiw_model/auth_cubit.dart';
import 'package:bookly_app/features/feature_auth/presentation/view/widgets/textField/custom_textField_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/function/regex.dart';
import '../../../../../core/utils/style.dart';
import 'custom_appBar/custom_appBar.dart';
import 'textField/custom_textFromField.dart';
import 'custom_text_button.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});
  String? email;
  String? password;
  String? name;
  String? phone;
  bool isLoading = false;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthRegisterSuccess) {
                toastification.show(
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
                Future.delayed(Duration(seconds: 1), () {
                  GoRouter.of(context).push(AppRouter.kLoginView);
                });
              } else if (state is AuthRegisterFailure) {
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
                  const SizedBox(height: 20),
                  Text(
                    "Welcome\nUser",
                    style: TextStyle(
                      fontSize: 40,
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Sign up to join",
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFromField(
                    title: "Name",
                    validator: Regex.validateName,
                    iconData: Icon(Icons.perm_identity),
                    onChange: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textInputType: TextInputType.phone,
                    validator: Regex.validatePhoneNumber,
                    title: "Phone",
                    onChange: (value) {
                      phone = value;
                    },
                    iconData: Icon(Icons.phone_enabled),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    title: "Email",
                    validator: Regex.validateEmail,
                    onChange: (value) {
                      email = value;
                    },
                    iconData: Icon(Icons.alternate_email),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromFieldPassword(
                    title: "Password",
                    validator: Regex.validatePassword,
                    onChange: (value) {
                      password = value;
                    },
                    iconData: Icon(Icons.visibility),
                  ),
                  SizedBox(height: heightMediaQuery * 0.03),
                  CustomTextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kLoginView);
                    },
                    text: "Have an account?",
                    textButton: "Sign in",
                  ),
                  SizedBox(height: heightMediaQuery * 0.08),
                  CustomButton(
                    isLoading: cubit.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.createNewAccount(
                            email: email!,
                            password: password!,
                            phone: phone!,
                            name: name!);
                      }
                    },
                    textButton: "Sign Up",
                    colorText: theme.colorScheme.primary,
                    colorButton: theme.colorScheme.onPrimary,
                    fontSize: 25,
                    borderButton: BorderRadius.circular(15),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
