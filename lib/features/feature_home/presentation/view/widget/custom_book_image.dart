import 'package:bookly_app/core/utils/assetsData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: imagePath ?? AssetsData.imageErrorUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Container(
                color: Colors.grey[300], // Placeholder color
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error_outline_sharp)),
        ));
  }
}
