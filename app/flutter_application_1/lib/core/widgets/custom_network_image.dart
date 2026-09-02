import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utills/app_constants.dart';



class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? placeholderColor;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double borderRadius;

  const CachedImageWidget({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderColor,
    this.placeholder,
    this.errorWidget,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        // placeholder: (context, url) => Assets.images.a.image(),
        errorWidget: (context, url, error) =>
            errorWidget ??
            const SizedBox(child: Center(child: Icon(Icons.error))),
        fadeInDuration: AppConstValue.fadeDuration,
        fadeOutDuration: AppConstValue.fadeDuration,
      ),
    );
  }
}