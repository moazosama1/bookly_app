import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/style.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      style: Style.textStyle18,
      cursorColor: theme.colorScheme.onPrimary,
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: Style.textStyle20.copyWith(fontWeight: FontWeight.w500),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Opacity(
                opacity: 0.8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: theme.colorScheme.onPrimary,
                  size: 20,
                ),
              )),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(color: Colors.white, width: 1.5));
  }
}