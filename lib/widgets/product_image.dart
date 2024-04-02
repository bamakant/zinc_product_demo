import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductImage extends StatelessWidget {
  final String? image;

  const ProductImage({super.key, required this.image});

  static const width = 100.0;
  static const height = 100.0;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: CachedNetworkImage(
          imageUrl: '$image',
          width: width,
          height: height,
          placeholder: (_, __) => Shimmer.fromColors(
            baseColor: Colors.black26,
            highlightColor: Colors.black12,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54),
              width: width,
              height: height,
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade900,
        boxShadow: kElevationToShadow[8],
      ),
    );
  }
}
