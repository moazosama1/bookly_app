import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_item_card.dart';

class FeatureListViewItemH extends StatelessWidget {
  const FeatureListViewItemH({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return SizedBox(
      height: heightMediaQuery * 0.28,
      child: ListView.separated(
        itemBuilder: (context, index) => const CustomItemCard(),
        separatorBuilder: (context, index) => SizedBox(
          width: widthMediaQuery * 0.04, // Space between items horizontally
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
