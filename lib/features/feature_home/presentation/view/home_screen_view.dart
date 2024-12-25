import 'package:bookly_app/features/feature_home/presentation/view/widget/home_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      body: HomeScreenBody(),
    );
  }
}
