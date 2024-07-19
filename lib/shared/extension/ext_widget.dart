import 'package:flutter/material.dart';

extension ExtWidget on Widget {
  Padding padding(EdgeInsets value) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Expanded expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Flexible flexible({int flex = 1}) {
    return Flexible(
      flex: flex,
      child: this,
    );
  }

  SizedBox size({
    double? height,
    double? width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }
}
