import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../shared/colors/colors.dart';

class BaseLoading extends StatelessWidget {
  const BaseLoading({super.key, this.color, this.size, this.height});

  final Color? color;
  final double? size;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: color ?? ColorApp.main,
          size: size ?? 32,
        ),
      ),
    );
  }
}
