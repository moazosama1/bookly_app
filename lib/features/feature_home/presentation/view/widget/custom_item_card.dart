
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_book_image.dart';

class CustomItemCard extends StatelessWidget {
  CustomItemCard({
    required this.imagePath,
    super.key,
  });
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.of(context).size.height;
    var widthMediaQuery = MediaQuery.of(context).size.width;
    BuildContext? dialogContext;
    return AspectRatio(
      aspectRatio: 2.9 / 4.5,
      child: CustomBookImage(imagePath: imagePath),
    );
  }
}


