import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarInAuth extends StatelessWidget {
   CustomAppBarInAuth({
    super.key,
    required this.onPressed
  });
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30,
            ))
      ],
    );
  }
}
