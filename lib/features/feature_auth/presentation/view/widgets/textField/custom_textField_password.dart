import 'package:bookly_app/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomTextFromFieldPassword extends StatefulWidget {
  CustomTextFromFieldPassword(
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
  State<CustomTextFromFieldPassword> createState() =>
      _CustomTextFromFieldPasswordState();
}

class _CustomTextFromFieldPasswordState
    extends State<CustomTextFromFieldPassword> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      validator:widget.validator,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onChanged: widget.onChange,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      obscureText: visibility,
      obscuringCharacter: "*",
      cursorColor: ColorOfApp.blueColor,
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
        suffixIcon: GestureDetector(
          child: Icon(
            visibility == true ? Icons.visibility : Icons.visibility_off,
          ),
          onTap: () {
            visibility = !visibility;
            setState(() {});
          },
        ),
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
