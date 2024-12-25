import 'package:another_flushbar/flushbar.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/feature_home/presentation/view/widget/custom_book_image.dart';
import 'package:bookly_app/features/feature_home/presentation/view/widget/custom_book_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../constant.dart';

class BestSellerItem extends StatelessWidget {
  BookModel bookModel;
  BestSellerItem({required this.bookModel});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (bookModel.volumeInfo!.authors!.isNotEmpty) {
          GoRouter.of(context)
              .push(AppRouter.kHomeViewDetails, extra: bookModel);
        }
        else{
          Flushbar(
            message: "This Book Not Avalible",
            messageSize: 20,
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.red[400],
            ),
            margin: EdgeInsets.all(20),
            flushbarStyle: FlushbarStyle.FLOATING,
            flushbarPosition: FlushbarPosition.BOTTOM,
            textDirection: Directionality.of(context),
            borderRadius: BorderRadius.circular(15),
            duration: Duration(seconds: 3),
            leftBarIndicatorColor: Colors.red[400],
          ).show(context);
        }
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4.5,
              child: CustomBookImage(
                  imagePath: bookModel.volumeInfo?.imageLinks?.thumbnail),
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
                      bookModel.volumeInfo?.title ?? "",
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
                  Text(
                    bookModel.volumeInfo?.authors?.isNotEmpty == true
                        ? bookModel.volumeInfo!.authors![0]
                        : "Unknown Author",
                    style: Style.textStyle18
                        .copyWith(color: theme.colorScheme.outline),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "${bookModel.saleInfo?.retailPrice?.amount ?? "free"}",
                        style: Style.textStyle22.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bookModel.saleInfo?.retailPrice?.currencyCode ?? "",
                        style: Style.textStyle22.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      CustomBookRating(
                        rating: bookModel.volumeInfo?.averageRating ?? 0,
                        count: bookModel.volumeInfo?.ratingsCount ?? 0,
                      ),
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
