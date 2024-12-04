import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assetsData.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logoApp3X,
            height: 20,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: theme.colorScheme.onPrimary,
                size: 24,
              )),
        ],
      ),
    );
  }
}