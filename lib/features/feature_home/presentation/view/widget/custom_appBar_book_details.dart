import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBarDetails extends StatelessWidget {
  const CustomAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.close , size: 40,)),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.cart , size: 35,)),
        ],
      ),
    );
  }
}
