import 'package:bookly_app/core/function/get_locale_data.dart';
import 'package:bookly_app/core/utils/custom_button.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/feature_auth/data/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../feature_auth/presentation/veiw_model/auth_cubit.dart';
import 'custom_appBar/custom_appBar_setting.dart';
import 'custom_identifier.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key, required this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBarSetting(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Info",
            style: Style.textStyle22,
          ),
          SizedBox(
            height: 10,
          ),
          CustomIdentifier(
            text: userModel?.name ?? "",
            iconData: Icons.perm_identity,
          ),
          SizedBox(
            height: 15,
          ),
          CustomIdentifier(
            text: userModel?.phone ?? "",
            iconData: Icons.phone_enabled,
          ),
          SizedBox(
            height: 15,
          ),
          CustomIdentifier(
            text: userModel?.email ?? "",
            iconData: Icons.email_outlined,
          ),
          SizedBox(
            height: 15,
          ),
          CustomIdentifier(
            text: "Book Saved ${userModel?.favorite?.length ?? 0}",
            iconData: Icons.bookmarks_sharp,
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            textButton: "Logout",
            colorButton: Colors.red,
            colorText: theme.colorScheme.onPrimary,
            isLoading: false,
            onPressed: () async {
              BlocProvider.of<AuthCubit>(context).logoutAccount();
              GoRouter.of(context).push(AppRouter.kAuthView);
            },
          ),
          Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
