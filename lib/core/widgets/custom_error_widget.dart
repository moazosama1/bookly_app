import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({super.key, required this.errorMessage});
  String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Style.textStyle22,
      ),
    );
  }
}
