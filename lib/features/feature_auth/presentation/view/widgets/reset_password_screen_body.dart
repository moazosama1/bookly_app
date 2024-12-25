import 'package:bookly_app/features/feature_auth/presentation/view/widgets/textField/custom_textFromField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/function/regex.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../../core/utils/style.dart';
import '../../veiw_model/auth_cubit.dart';
import 'custom_appBar/custom_appBar.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  ResetPasswordScreenBody({super.key});
  String? email;
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
              if (state is AuthResetSuccess) {
                var show = toastification.show(
                  context: context,
                  foregroundColor: Colors.white,
                  showProgressBar: false,
                  title: Text(
                    "Check Email",
                    style: Style.textStyle18,
                  ),
                  autoCloseDuration: const Duration(seconds: 2),
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.lightGreen,
                  borderSide: BorderSide.none,
                );
              } else if (state is AuthResetFailure) {
                toastification.show(
                  context: context,
                  foregroundColor: Colors.white,
                  showProgressBar: false,
                  title: Text(
                    state.errorMessage,
                    style: Style.textStyle18,
                  ),
                  autoCloseDuration: const Duration(seconds: 2),
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
                    "Forget\nPassword",
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
                    opacity: 0.8,
                    child: Text(
                      "Don't worry! It happens. Please enter the address associated with your account.",
                      style: TextStyle(
                        fontSize: 13,
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
                  SizedBox(height: heightMediaQuery * 0.1),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    isLoading: cubit.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.resetPassword(email: email!);
                      }
                    },
                    colorLoading: theme.colorScheme.onPrimary,
                    textButton: "Submit",
                    colorText: theme.colorScheme.onPrimary,
                    colorButton: ColorOfApp.blueColor,
                    fontSize: 25,
                    borderButton: BorderRadius.circular(15),
                  ),
                  SizedBox(height: heightMediaQuery * 0.2),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
