import 'package:bookly_app/features/feature_auth/data/model/user.dart';
import 'package:bookly_app/features/feature_settings/presentation/view/widgets/setting_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key , required this.userModel});
  final UserModel? userModel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingViewBody(userModel: userModel,),
    );
  }
}
