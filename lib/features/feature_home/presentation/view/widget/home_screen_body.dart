import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../../core/utils/style.dart';
import 'appBar_widgets/custom_appBar_home.dart';
import 'list_of_itme/feature_listView_h.dart';
import 'list_of_itme/feature_list_best_seller.dart';

class HomeScreenBody extends StatelessWidget {
   const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
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
        SliverToBoxAdapter(child: FeatureListBestSeller(),),
        SliverToBoxAdapter(
          child: SizedBox(height: 20,),
        )
      ],
    );
  }
}
