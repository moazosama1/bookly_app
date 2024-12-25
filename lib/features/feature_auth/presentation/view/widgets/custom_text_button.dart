import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({
    super.key,
     required this.onPressed,
     required this.text,
     required this.textButton
  });
  void Function() onPressed ;
  final String text;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.7,
          child: Text(
            text,
            style:
            Style.textStyle20.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style:
            Style.textStyle18.copyWith(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
