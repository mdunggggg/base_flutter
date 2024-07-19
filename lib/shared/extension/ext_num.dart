import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension extNum on num {
  String formatDate({
    String? valDefault,
    String? format,
  }) {
    try {
      final double time = double.tryParse(toString()) ?? 0;
      if (time <= 0) {
        return valDefault ?? '';
      }
      return DateFormat(format ?? 'dd/MM/yyyy')
          .format(DateTime.fromMillisecondsSinceEpoch(time.round() * 1000));
    } catch (e) {
      return valDefault ?? '';
    }
  }

  BorderRadius get radius => BorderRadius.circular(toDouble());
  BorderRadius get radiusTop =>
      BorderRadius.vertical(top: Radius.circular(toDouble()));
  BorderRadius get radiusBottom =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble()));
  BorderRadius get radiusLeft =>
      BorderRadius.horizontal(left: Radius.circular(toDouble()));
  BorderRadius get radiusRight =>
      BorderRadius.horizontal(right: Radius.circular(toDouble()));

  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());

  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get paddingVer => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get paddingHor => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get padding => EdgeInsets.all(toDouble());
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());

  String get secondsToTime {
    if (seconds.inDays > 0) {
      return '${seconds.inDays} d';
    }
    if (seconds.inHours > 0) {
      return '${seconds.inHours} h';
    }
    if (seconds.inMinutes > 0) {
      return '${seconds.inMinutes} h';
    }
    return '${seconds.inSeconds} s';
  }
}

extension extNumOrNull on num? {
  num get validator => this ?? 0;

}
