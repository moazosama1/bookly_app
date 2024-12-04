import 'package:flutter/cupertino.dart';

import '../../../../feature_home/presentation/view/widget/best_seller_item.dart';

class FeatureListSearchItems extends StatelessWidget {
  const FeatureListSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BestSellerItem(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20, // Space between items horizontally
      ),
      scrollDirection: Axis.vertical,
      itemCount: 15,
    );
  }
}
