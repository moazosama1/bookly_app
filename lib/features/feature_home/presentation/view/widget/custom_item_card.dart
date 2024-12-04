import 'package:bookly_app/core/utils/assetsData.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kHomeViewDetails);
      },
      child: AspectRatio(
        aspectRatio: 2.9 / 4.5,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsData.image1Test), fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(18))),
        ),
      ),
    );
  }
}
