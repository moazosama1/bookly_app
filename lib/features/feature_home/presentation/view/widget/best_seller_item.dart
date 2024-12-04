import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/feature_home/presentation/view/widget/custom_book_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assetsData.dart';
import '../../../../constant.dart';

class BestSellerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kHomeViewDetails);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4.5,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsData.image2Test),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            SizedBox(
              width: widthMediaQuery * 0.07,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widthMediaQuery * 0.5,
                    child: Text(
                      "Harry Potter and the Goblet of Fire",
                      style: Style.textStyle22.copyWith(
                          fontFamily: gTSectraFine,
                          color: theme.colorScheme.onPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text("Rudyard Kipling",
                      style: Style.textStyle18
                          .copyWith(color: theme.colorScheme.outline)),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "19.99 €",
                        style: Style.textStyle22.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      CustomBookRating(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
