import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemLoading extends StatelessWidget {
  const CustomItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.9 / 4.5,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8), // Rounded corners
            child: Container(
              color: Colors.grey[300], // Placeholder color
            ),
          ),
        )
    );
  }
}