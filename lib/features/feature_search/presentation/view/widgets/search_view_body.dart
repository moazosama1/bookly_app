import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'appBar_widget/custom_search_appBar.dart';
import 'custom_text_fiield.dart';
import 'feature_list_search_itmes.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var sizeMediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSearchAppBar(),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            textEditingController: TextEditingController(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Search Result",
            style: Style.textStyle20,
          ),
          const SizedBox(
            height: 15,
          ),
          const FeatureListSearchItems()
        ],
      ),
    );
  }
}


