import 'package:bookly_app/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField(
      {super.key,
      required this.title,
      required this.iconData,
      this.onChange,
      this.validator,
      this.textInputType});
  final String title;
  final Icon iconData;
  final TextInputType? textInputType;
  void Function(String)? onChange;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      keyboardType: textInputType ?? TextInputType.text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      cursorColor: ColorOfApp.blueColor,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
        suffixIcon: iconData,
        suffixIconColor: theme.colorScheme.onPrimary,
        filled: true,
        fillColor: Colors.white12,
        border: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(15));
  }
}
