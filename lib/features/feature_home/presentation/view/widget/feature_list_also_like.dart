import 'package:flutter/material.dart';

import '../../../../feature_home/presentation/view/widget/custom_item_card.dart';

class FeatureListAlsoLike extends StatelessWidget {
  const FeatureListAlsoLike({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
            width: widthMediaQuery * 0.21,
            child: const CustomItemCard(),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 15),
    );
  }
}