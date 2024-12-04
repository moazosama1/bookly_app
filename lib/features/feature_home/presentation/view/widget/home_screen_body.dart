import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'custom_appBar.dart';
import 'feature_listView_h.dart';
import 'feature_list_best_seller.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: CustomAppBar(),
              ),
              FeatureListViewItemH(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Best Seller",
                  style: Style.textStyle20,
                ),
              ),
            ],
          ),
        ),
        FeatureListBestSeller()
      ],
    );
  }
}
