import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import 'loading.dart';

class BaseCacheImage extends StatelessWidget {
  const BaseCacheImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.borderRadius = BorderRadius.zero,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        fit: fit ?? BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Color.fromARGB(0, 244, 67, 54),
                BlendMode.colorBurn,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => const BaseLoading(),
        errorWidget: (context, url, error) => Assets.images.meme.image(
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
