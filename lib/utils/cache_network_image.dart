import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/utils/colors.dart';

class AppNetWorkImage extends StatelessWidget {
  const AppNetWorkImage({
    super.key,
    this.height,
    this.weight,
    this.border,
    this.radius = 0,
    this.fit = BoxFit.cover,
    required this.imageUrl,
  });

  final String imageUrl;
  final double? height;
  final double? weight;
  final double radius;
  final BoxFit fit;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          width: weight,
          fit: fit,
          errorWidget: (context, url, error) => const SizedBox(),
          placeholder: (context, url) => const SizedBox(),
        ),
      ),
    );
  }
}
