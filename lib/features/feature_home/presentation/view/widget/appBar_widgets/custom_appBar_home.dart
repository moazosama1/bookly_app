import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/feature_auth/data/model/user.dart';
import 'package:bookly_app/features/feature_auth/presentation/veiw_model/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/assetsData.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  UserModel? userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsData.logoSvg,
            height: 25,
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSearchView);
                  },
                  icon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: theme.colorScheme.onPrimary,
                    size: 24,
                  )),
              IconButton(
                onPressed: () async {
                  userModel = await cubit.getUserInfo();
                  GoRouter.of(context)
                      .push(AppRouter.kSettingView, extra: userModel);
                },
                icon: ImageIcon(
                  AssetImage(AssetsData.imageMenu),
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
