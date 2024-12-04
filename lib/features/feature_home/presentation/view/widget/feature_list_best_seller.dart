import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'best_seller_item.dart';

class FeatureListBestSeller extends StatelessWidget {
  const FeatureListBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: BestSellerItem(),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20, // Space between items horizontally
      ),
      itemCount: 15,
    );
  }
}
